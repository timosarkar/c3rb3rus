
rule EXPL_LNX_CUPS_CVE_2024_47177_Sep24 {
   meta:
      description = "Detects exploit code for CUPS CVE-2024-47177"
      author = "Florian Roth"
      reference = "https://github.com/OpenPrinting/cups-browsed/security/advisories/GHSA-rj88-6mr5-rcw8"
      date = "2024-09-27"
      score = 75
   strings:
      $s1 = "FoomaticRIPCommandLine: " ascii
      $s2 = "cupsFilter2 : " ascii
   condition:
      filesize < 400KB and all of them
}

rule SUSP_EXPL_LNX_CUPS_CVE_2024_47177_Sep24 {
   meta:
      description = "Detects suspicious FoomaticRIPCommandLine command in printer config, which could be used to exploit CUPS CVE-2024-47177"
      author = "Florian Roth"
      reference = "https://github.com/OpenPrinting/cups-browsed/security/advisories/GHSA-rj88-6mr5-rcw8"
      date = "2024-09-27"
      score = 65
   strings:
      $ = "FoomaticRIPCommandLine: \"bash " ascii
      $ = "FoomaticRIPCommandLine: \"sh " ascii
      $ = "FoomaticRIPCommandLine: \"python " ascii
      $ = "FoomaticRIPCommandLine: \"perl " ascii
      $ = "FoomaticRIPCommandLine: \"echo " ascii
      $ = "FoomaticRIPCommandLine: \\\"bash " ascii
      $ = "FoomaticRIPCommandLine: \\\"sh " ascii
      $ = "FoomaticRIPCommandLine: \\\"python " ascii
      $ = "FoomaticRIPCommandLine: \\\"perl " ascii
      $ = "FoomaticRIPCommandLine: \\\"echo " ascii
   condition:
      1 of them
}
