Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013059.outbound.protection.outlook.com [52.101.83.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7693638AC87
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419476; cv=fail; b=Dc9NOlLHNaMrtjqI4kWQiS0ds384rRFS9JL+HEa956kWspvJO720Kp2/qOgq7ktmjYRzcGgLP0enFOd12yGMUNIGmULaE7GTlQP5+z6Jh9gDFptZ6ZOKUa/nMZ4MBPVI39K4BBUqTd0X2WcNUQc2mGQdvKzKeZZOHsLP3ojvQ7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419476; c=relaxed/simple;
	bh=Ux57kPd/LgUCwapPW/erhTjuLpKVGSMqw9z6Po8Oazk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B6wBdbvbZ91KkkTnpp9qLZ23wI6iwylQvin9/elzeBe0hXMwrhxj34Kxg6cCC5Y2UP3m11pRHBTrwSxLXG7LzM92cmu7C072bka5L7cqr/afdYvhWsJdL4I8jtJKuc4y3irrMQCqAUgphY7X5XcYk1q95PJ2+puLT4vCRwTEt5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HOqqVZ1/ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HOqqVZ1/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYwvkNFgy5kn5J/IMGJ9/00JjXHexUPzB6WFzExX2P+xPddgFNckHan0MXUF8BqgRf5KuQtz8YPrIPnFF60LpWW8Hth1ZqC0mJmAZ4Oq+2FYbHyqp1bCpXYf8xOHSo/Qzz74hU/xttq8n+QhsY4aV1lefcMIafWZmsJKY1rSfz1eTe9wejNaqcoausCdU//eDsZZqpC0/DB1rs41fSc0siEs6aL34okGNjOYwdgm2jyR6BSHyeXvrNnf4VIIc0tBRSFJt34b+V0SgGhGdqRDLFdVQHSK745GOK9u365MFEQ+DcUaxnWa4Ztu5hFbt9O9ofbb/t/X8F3TZ/B5+DFrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/zsQfJ8QqLNvMfzBnxuFa2SvvpBX4AziJ1V52wTh3U=;
 b=V6wOzf2N4IFMBzGpi4x3lNFxjxCWxIeoBz3+Q/dS0RdKyt5dRUKtYHhfmRH9uf9CEA9hOVBw3TKVbVLVsXypH6g6HE3QlzSl4h3xTsjWtzpyIsz5+YqRBv1rIgyKRJPPF+FNz5Esqu+gxXcWWvuL6N2Q6X0WIVuU2aK6xrIGrpLtj5C9FVr+qKi24LinEmXACpZ6MyKLsox0u8uKV8BuT4QiI7jokBoll2wuwnaak+X0DNUDbzTlkebBQP9kuJkqHWboUfeb4SauS783y5Z64LYA4uiArtrQdpj9JNW9a4tuEBtV0Gz3UvvToIgE4AbUrDYkanznmE0SoDZrntbvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/zsQfJ8QqLNvMfzBnxuFa2SvvpBX4AziJ1V52wTh3U=;
 b=HOqqVZ1/ziiEyKnrU2omPmjeK4fQrloHZkQfs+Wba4vi1fsRMsiqFOf1oBz4WXTUSsG9Pm8pJluUIYXzQ1u8x7h9/NnhjWrOPDMdigsVC1zaje+/xCzaIyIeoEqpbN1YMXBDruYfXzzs67DI3FJm29zmv2vzFIbBN/+JypMpqtJrGA6N60fobD3Gz5nc68i4FTGhGhqQZ5vXKbxzo/VSjX0OyPpmhbOt4s4Opcw57EUFYkkbBTvKHzmqJd+dCmAdajuRiWtR2HrfvMS/ZGUba1yjJwk0peJr759a7RHzgzyE4zcmLAJ6aYUWpwzvPutmRIGG7lEAbmzY2loSdm4Mqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10979.eurprd04.prod.outlook.com (2603:10a6:800:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 16:57:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 16:57:50 +0000
Date: Tue, 2 Jun 2026 12:57:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v7 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the required quirk
Message-ID: <ah8LiLPXssB5VYjm@lizhi-Precision-Tower-5810>
References: <20260525092405.1514213-4-manikandan.m@microchip.com>
 <20260525102331.8AE921F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525102331.8AE921F00A3A@smtp.kernel.org>
X-ClientProxiedBy: PH5P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10979:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a544b7-3e1c-4195-763a-08dec0c814a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|18002099003|22082099003|6133799003|56012099006|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	y3ht+crFMQp98mNB1S9ICgbOQrMEz+6DT1/bbhYVr+SzvZLGfHcR9Ape1TYL4/A8DgWBmXAQ+L0oGuBPrmQTWroLfO4lZM2Zwileidc49OEwGce/GtAVMrbnwKY7jy3fH/S5ggHkqL4mphVmp2m8jdK2Q0jfwxllWb5G/JmGMPOfg7PBJQaD3WgCLML6Z0teiy0GIOdPuI4cTmFyTnq3MJjxk72R+A8BZpC9FYa06k6FawGiwQbYiv0yB7PWqhZVrnplsbBpQjXOuoVtyEQ9xtcr5IEp+MJ5m6NysmiDpoPVkXd2ET2ETKnK91ynJ2hCScV/nEv/3IAiqs02Z6ZqwxhAKVPZeNOC4+tzGzatkWwcNjKUAO04RKsd+NTAlaAbgmVOTQwglcV0KFnJDYoK7xMVvSd9wPqMkoDzzIIOuINfAYrnIdBMb7OgvWWdmmby5m9WyNn9FBbjfQRrmCQNqIOzkB/xn2WeAfDcANP5JCRO6sKox0Qg99SkRidTslThG26/86pDEpD+Pep4v3wQ024MKWxEDO3IqKrW4igFjE8fHDS/itVVjzCd/1onx09JZ9ls1zq59TvuPnJY5U1DiZBYJteU2KgCnynmeBvoINDS8KN+3yP94J2TiQQd1QjVFPBjpW/gyRCxT973Lj2O9X2CTg/hkbzS20/2IA75o7ia/ebY6dc4CbLZVZQnT7jr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(18002099003)(22082099003)(6133799003)(56012099006)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?G+FfI3OPDeH6kekIIzg80Pl3dedbQpXlkOknihuolH43fhuzExYHDOOUhH?=
 =?iso-8859-1?Q?6i56fyF2+JS9v6WCQ+bJuq2P1g+Syoev4TPA6Br52EJTaULpjKLeqXBUBr?=
 =?iso-8859-1?Q?OvKj0HtoaI88um0ifgCNWppQWDxHV0VRJJafbOFYBN4DHCFP4QNGHDloRt?=
 =?iso-8859-1?Q?DLJaCy8VQSYIljn7QcU0KQeKfvwvrawL1xJmgS8g10Igs98c1zU2wPrtr9?=
 =?iso-8859-1?Q?psDrfe6WCIouBf21y4cWes2DGKvD12NSW+qgk8GHdFpfTH68F0IQkIs/Fz?=
 =?iso-8859-1?Q?wwYocIy2CeeNt8FTsOfO4jhdlAdEkSEYiW7L2Aw7SSqQbYdYcRHeTN9RWB?=
 =?iso-8859-1?Q?zAhTngU/MVXh5K9/Bz6iaB8fMylfeDfhmgTbhdEgVX9BXZQuU/ZldIgWzf?=
 =?iso-8859-1?Q?erWZATI9AriVBWSOGbXtXwdpQgotZV4vEVs11u6ILDSngsspCl90ZFRK7y?=
 =?iso-8859-1?Q?LnPTGfOIuKVbr8UL3qvtcihl5Lp4z2URqOObqvc1ARqTyB2CiG96MYTx9b?=
 =?iso-8859-1?Q?vVYEOXP9wreLfLegL4hH0G8JT6oJQZWCo8XGbFTyrk/cC9ERv/vRKrXztW?=
 =?iso-8859-1?Q?hvpRWXFyoy1h78z9fpWTAjPjPffCG1LKPsfvhIB88OP5wSApHx01PwZbFJ?=
 =?iso-8859-1?Q?aTndYA6OiM7pywGh0SMn3C2ps7aEn/AgQAqa2edkI1m+RuBoRNLEQmywOJ?=
 =?iso-8859-1?Q?msqKYJfrL/G9dNFO0n0R/TjEQ+I5siXd/tmNadOleIOhMtXFSJoNvW5jg6?=
 =?iso-8859-1?Q?FfyT+zeXCVI68n6+Y5lfqafXpj0p9Aw2wcGHY1Yo797UhbEURJu+iboCi1?=
 =?iso-8859-1?Q?kg+VqEMCtEi8yOEFwgXptoJZbpFlWWOdiHcAJGPVLMqacFQjNHpTlL7gV7?=
 =?iso-8859-1?Q?QlDn67vlsOPZgFq0sTWdJcFBNKhRvgLzC0YXz8U9RIGAInh4Nb2ry8uktn?=
 =?iso-8859-1?Q?J90/HklfiRVU+Wj1VYXLFfsnunTKBJFnwiSMP6V5szAwcc+qEfZRnrOIR2?=
 =?iso-8859-1?Q?l1qWA7/YB12ckQ/Nxoz0GcYrODdtKrT2f/e+dYui6mftql4c7SlKw113yo?=
 =?iso-8859-1?Q?45k4hIEIPZm8swyJ+/6Y9RzlSMJKSnqTz82sCFAbZQpiOjjBrCYYZTLTMA?=
 =?iso-8859-1?Q?j2r7j5IURI+VqTiNzQTNYdwODfNlV5avEcmOl8DoS8pNbV10Z8Ky29z2L2?=
 =?iso-8859-1?Q?YOmmdQ//Z/NQrdUfNOcZf4MmR1bRcX5uCpoLnrVHb4lOc8/uwddrli7Xkn?=
 =?iso-8859-1?Q?ISfKTZrdoQ+YQUTIqIkxo+I9EhhcMRLT0ClD7xxIFvxeCJ0vs88CFPlZ0j?=
 =?iso-8859-1?Q?hefqsmE2fsRGJ+Xm5inq5VkEIcoCPlCsKF8O9b/Z7PY8G1BO1kokgwhQOs?=
 =?iso-8859-1?Q?Bhm0g2LfXg9qpsK8r1z9wvWsLaQTofgB92wLtJ8fJNREwdK6Qsp0RfFIQf?=
 =?iso-8859-1?Q?mCnGxcxM6cNi5e5yJ8/qrVVmtYM0quxoCntwjslyvFU+Kg2BV3Iw0DiQ3c?=
 =?iso-8859-1?Q?d0vU0+eyTpk2e68mJR+PO1DV3Xq5virvLLjvZ677c1v3SO1eT6NAdldXvQ?=
 =?iso-8859-1?Q?gm5Jw/L/6aH7LCvBzQRCP3388NTtTPHKGsW4rH1jH4y2lbq6P7I8e+uLgB?=
 =?iso-8859-1?Q?uwyvY1/wwihsT2rnK2O749GjkE5o4k1f3NXYYVecRL7Tb7bmQJNlMsROMu?=
 =?iso-8859-1?Q?gFatSFLch3pzguZnl1/Dblku7BeQ6mT8pLCAw4kS45Z/OJP8tLgM5bxhPa?=
 =?iso-8859-1?Q?GyvlKRmjOw2NY1tsg1FWJeM1+UI/CqzHH41BUUr4i1JdFphCoHgDNI/e0Z?=
 =?iso-8859-1?Q?MOOoOg7NLA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a544b7-3e1c-4195-763a-08dec0c814a5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:57:50.7034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nMrvgPSG47us8bYbg4cbxWMX5tKyJqUc5Rmt/L0JtJpcL2XgFZxQhgdEvBNM9RHAQWtb+Qj03N1vZ5tAQwSew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10979

On Mon, May 25, 2026 at 10:23:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Reusing AMD-specific hardcoded timing quirks for a Microchip SoC will result in incorrect I3C bus frequencies.
> --
>
> commit 8dab9b9edc49c0214800ec48372900ae0b5bbae4
> Author: Manikandan Muralidharan <manikandan.m@microchip.com>
>
> i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the required quirk
>
> This commit adds support for the Microchip sama7d65 SoC I3C HCI master IP.
> It introduces clock acquisition during probe and applies specific quirks
> to the new compatible string.
>
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> > index b781dbed21650..4cdf2abd42197 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> [ ... ]
> > @@ -969,6 +970,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
> >  static int i3c_hci_probe(struct platform_device *pdev)
> >  {
> >  	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
> > +	struct clk_bulk_data *clks;
> >  	struct i3c_hci *hci;
> >  	int irq, ret;
> [ ... ]
> > @@ -1001,6 +1003,11 @@ static int i3c_hci_probe(struct platform_device *pdev)
> >  	if (!hci->quirks && platform_get_device_id(pdev))
> >  		hci->quirks = platform_get_device_id(pdev)->driver_data;
> >
> > +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> > +	if (ret < 0)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to get clocks\n");
> > +
> >  	ret = i3c_hci_init(hci);
> [ ... ]
> > @@ -1031,6 +1038,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
> >
> >  static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
> >  	{ .compatible = "mipi-i3c-hci", },
> > +	{ .compatible = "microchip,sama7d65-i3c-hci",
> > +	  .data = (void *)(ulong)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
> > +				  HCI_QUIRK_RESP_BUF_THLD) },
>
> [Severity: High]
> Will applying HCI_QUIRK_OD_PP_TIMING to this Microchip SoC result in
> incorrect I3C bus frequencies?
>
> This quirk typically invokes amd_set_od_pp_timing(), which writes hardcoded
> timing divisors (0x00cf00cf for Open Drain and 0x00160016 for Push-Pull) to
> the controller's vendor-specific registers. These fixed values were
> calculated for a 9MHz I3C bus frequency assuming an AMD platform's specific
> fixed input clock of roughly 400 MHz.

Look like make sense. Is it true?

Frank
>
> Since the Microchip SoC acquires its clocks dynamically via
> devm_clk_bulk_get_all_enabled() as seen above, its input clock rate could
> differ and vary based on the system's clock tree configuration.
>
> Should these timing divisors be calculated dynamically against the actual
> input clock rate obtained from the clock framework rather than blindly
> reusing the fixed AMD divisors?
>
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260525092405.1514213-1-manikandan.m@microchip.com?part=3
