Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A564ABBCE;
	Thu, 17 Sep 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671131; cv=fail; b=jCLbJQkx5lZs3y2+mKEFdmffPDkPJzAcxBDItNY/idAR/Ka9On5ggQEeE9V2mA27QJ3wavXuWjImCHaYhakQSbUMVd7u6in71l9q83EepjhK+qq4SR2I0CuojiltfNXVIAe7TZTt9l06ldcg6iqRxyddjhE5Zw3jxKMAQp9WMmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671131; c=relaxed/simple;
	bh=n8QXtn32DWldY3ui8TRY0BJMHVd+V2ocwBDUZiE3z40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YOwV5MlpLUzGy5fWzsxm9QDtkoNH592+IFyT3DjyC0M9HeUe8PGGqgxvp2Jlw4tuKTmx0XEPc62DSgGoZ6b5WtILpqrZlfZUhxAPAy01+Aj5kp/K1NJYA0fQxDXvh9BpcXDNxDgbLEUmNTmJFGLleWVYk6jMYMbu45qJeCzj/ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wWk6e0kg reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wWk6e0kg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyCRgErUkxEyp/6hr90xjmtL3EjxJEbnGYBE4SJwKKYqeurV1N5Ut/xzhnN1PMFToq5Y4lACE2+O5gC8V+JTlqhvOaPsoeVkXU6auo7npl6bOuZ+0jH0sUeUOxvuPJM67qnCgqOofk9qmjX+QSMoOzNzDLeM0mpX/fB93R9G4dkh+phakBZ96uvy9MrK7UtslGBdwLNcacIqqFUgBxEvFqy+9D5ArnBSw3CsopQG4Kmj1brkF2jHyXrGc45SRMUFR3CGBdEOCmu9dYoY4gccGTkYZpU5euuHBOKMPmATvbqcTCwpw6G2DTUSBJ+ncKexO79vGYYvD7uV5BS/84i0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTYvSfhmUHo+14xPKoN0CBXIX5AGlw2Dxgk4f2r5BaY=;
 b=rhfr3QQpf8AScyZr9fgP21oJoEXn/PMVrjyB/3dSMAPm+IDYvbPZhIzj5K1WoW7pYBFi0Iy5jMwAlJwyGGWC1HNNZb6ppzsBI/WzWeDxlfJxY6/zl21Vj+b/DV1ZUDPtNyNlXqjzLOqokg3sir1IflGalHvQJZ8PFxtbRIE3dgiFDfD9Rm0UsZ/eqcFeRcATJP7hUYeTdxgFpmBhGQFAphPu+b+xCli8nAAvTsBeoYQO1QQcGqA7w1YtMO0KcEPLtdYrxWUVRSu9+VPs2dw5XmhKAG1/MbNMJV2RgPv0F0OX+sNfeLQpLLjoo3p1C9pnd5TAUr11uFek65Fn85uwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTYvSfhmUHo+14xPKoN0CBXIX5AGlw2Dxgk4f2r5BaY=;
 b=wWk6e0kgALnnbvvptTz7kjYIPiYpFuInFNKAtKkL4ZcD487GDhO6FK1+QeXtuAiYs20TPmaUOMMd087oCAOvMFiQjp00s+R5QMUHzXtZ9Suok+eQreviagcdhu6XOf2BUTLqFK9Ck1AGmz86SHrjyhAk1E34e8JAh1mzpung71mIjGbBgfP459EBHqoYKZFsL8sc+cOQtgCdS972nNBm59anqVg2QfSY2ahixCSgpznTjGmj1C2igByv1jP603AbE0h15Ncu7NTHS2PifTn+sNBmTqFEqRFbfxpbCNvDv4qv/NgclFnjT4GDbGn7jCnz6fo2620H/EBcx7sQ6fBUIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9235.eurprd04.prod.outlook.com (2603:10a6:10:371::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 18:52:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:52:06 +0000
Date: Thu, 17 Sep 2026 13:51:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, conor+dt@kernel.org,
	robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Message-ID: <aqw2zT8W6EvRroWj@SMW015318>
References: <cover.1789659585.git.stefano.r@variscite.com>
 <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
 <20260917155033.C43521F00899@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917155033.C43521F00899@smtp.kernel.org>
X-ClientProxiedBy: CY8PR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:930:49::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: 67530453-015f-4985-8cb1-08df14ecc4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|56012099006|11063799006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K9nwlgWws1tAaROVKoBbip7Hw5PRUPqVKsc/94CMnV/Jm9wZ8EUW4nHUlyR3UlQ4VKOMv4exgWK30IzKG5ooIGjbGw9sBnls5QNeeQduVvd5/1cL80ipDP6/UElfWuaaoFVXFN9mKHB2ClUIAMxb9z5yLB5EuVbuS68nXOQRHPMjjXaKrsPmWOqtqkb94z2s90yOl+zcR0PxR8+05CKbcz9lQYcTC6EDiUVwG26AICtt/nHkWyaKAknTk/Q9AQLFFUxtn4ZFg1HIjDMnJgaOvQgTP+pezleFW9axTJ74h8G+YF/FuLRES29GX5xNDFll8rifZfldfIZmX0JVDU5BPXmfKYvB96rWjrT07F9CvoIHwAvRJvIk8NO9npQjmKeSGLeDrVFKf0SouSqEU9XItT3/ymrJp1fJDHDWnY5M+sEypZoRjA+O4o3gAAObg5AcH9+0DSWk+WTzrg/f8BLbRYRoBXOqKVjcIU7NgLWtEeMT4Jio2iUFw6C7Fwt4KjcBWgSAUJxeVCBrJ6QB7lPvWDnsvTNTVzAdMJGr4dDOdvB7X8aG6ObbEz2f7+Qy4X5AtXxC/7/qZhSfzz0jNPL3cadkvy9RWOnvOXNiksRPavU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?RHJmOz8/QOr1wq7pC132CLmIV+EV6jVRBMdY2FI+PgCj112fDrIywUokkD?=
 =?iso-8859-1?Q?rx4pLtd/5cQyCpdoqTKB52wMt6GU2RaVKVxh13PuigE/WeyhCtxrZPfXut?=
 =?iso-8859-1?Q?kPK8KAVmr6UFndjdCYvYWPhMPD+50X5owoWfzmDR1F1EtEnbryNhTFUM2K?=
 =?iso-8859-1?Q?G3PXmTOzvZy9c8YEAVHkp8fh+Nf8SxzUdbAKR+VGWjqaNYnveEwh/zHr++?=
 =?iso-8859-1?Q?fwTrlI5vXAPkIC+7BbVoJo1ovLxXiFs1qGNHQV9lTPrjgGidlRHB43mjzZ?=
 =?iso-8859-1?Q?BA6Uj/5+XwOaKR4uwD45zbCi0TFx10RLM9Dv19rP4zH0TLr16ciUoTTo5s?=
 =?iso-8859-1?Q?vtr2X/nm9zFko4wacWC+Khwi+KkLSnGCS/s4219hlpuFCs6G75yJ3LYlIM?=
 =?iso-8859-1?Q?rsttuaDhBP9QBx0KoRZy6qs4b0J2kCTW2MXAXhFUhv/Qoa0x5vmLpvGmwj?=
 =?iso-8859-1?Q?wkXqDiOAQ+oW/D8rsYrjF+4NYc/sHvsZ08Y593rb35MRRNYnPUAt2FQhlf?=
 =?iso-8859-1?Q?T0LvBU3lHps4FyUevTG6RlIuw97JsqVGopnrDGPozE9llUY0g44CQuKUY6?=
 =?iso-8859-1?Q?vjK1viIYCOu+Fb8ajOpBbv5cI5z3MZPBLJbbFu//SK3CGJSrGVUcw/lNDT?=
 =?iso-8859-1?Q?zql2sGKO17U4CgNMYYWNO1m7Yk2nBiU9Cq/fKcoUYjSSTp48B4WAdYRT6W?=
 =?iso-8859-1?Q?gzz2rxaMw6cm1gP1UCw09SykOSR/NPwIt95SXR61TOinBatuhPJ2Wo5C58?=
 =?iso-8859-1?Q?YlI26/a7gZV9wjXzRL8urqK8/aZDnvmLmDZYLqfdzaEc9f/qd7Nw++gNBi?=
 =?iso-8859-1?Q?6v+DavsPJORed0VHJ91uC2VJ2H89KiJSsir77akcddwYvoCMrFFX/YPMMe?=
 =?iso-8859-1?Q?LO72/AievzuErCng531taK6MjvxcoNjHxVU8DZyPW4hk9GUSEhUmPqFC3H?=
 =?iso-8859-1?Q?YSVQobptLI1C4a5FqvmGKXQCnVWrmVUZFwLPicRxTsMqvTYNuX2mxM4Wbv?=
 =?iso-8859-1?Q?Mzgik5HO0s0gnqUy+z9hWAGqZU5B0mEXO0iP7742j+TGIKaQBg3WankRMz?=
 =?iso-8859-1?Q?x6SbImb2BkVjmCiny3TsN8w9qy0uZEQO14XGFCX34eNTDOd4s4g7Rs45IV?=
 =?iso-8859-1?Q?mQSvs87BZ1C18+Omd17qaxTTp4xoAl1J41Km8tZq5i1ZwKiuj39dFDSNX2?=
 =?iso-8859-1?Q?YcrGU6B1UldQwOgmuHn9VQZmex1jPKhbU1pY8Pf/16VwMEfGlAIKxb9Du0?=
 =?iso-8859-1?Q?O1TsQdaAbwYyVbsE1v5oN1D1pBxNToODuKHNUOICVDj6lSTbpF8KvRWdMO?=
 =?iso-8859-1?Q?7HeeJt+gNF9nBA33C5nPVbSMltV4nXDLl1DHctDGDNfDa7eQ+9cQ5hevY2?=
 =?iso-8859-1?Q?KlGB8O0azvf6YNmhDCzQ9WCNe/CcEzCAewmYfb7ZNTcq+e0VHlYXUTLVOm?=
 =?iso-8859-1?Q?bcIKoHlATpS6V+a9cHGOIVAXQKzuQb8yi9sVzfCNUYFKr4zYxyySdak2KP?=
 =?iso-8859-1?Q?ZgG9d26lal3UGXQFwJCm9TPiJjdC4O7zM5FwENEQEZxWd2UNTylK306YmE?=
 =?iso-8859-1?Q?IBD6MNYh9YzxNEhPxRk87u6R6JXscZSaaQhji9pCLkUS7YbhqLyKfZpHOf?=
 =?iso-8859-1?Q?n1UJ0XRKWvwE1PHoZ461Yl3/KmG8HMJId2CSnBa67lko8HDX0tHD8NnOpf?=
 =?iso-8859-1?Q?yZV/Yo7ra8nhb8aVUHYt4YCZ4yXDzi/BwvgE/suoUbdNTIXYOC5ESTKa2c?=
 =?iso-8859-1?Q?GxCNYQAx3Fp0+Js8sNSJp7CotktD2V+/+TJQgAFLsnuVoywTqX4aEdXXmP?=
 =?iso-8859-1?Q?+m9hdGxzBA50fu4qG4rZqg2nxa/97PIhNgUjQWCeLcBVBuhdWASE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67530453-015f-4985-8cb1-08df14ecc4f2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:52:06.1997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zS8vq8CwK/QW9JaPFd/jpJHxef1D1qOo1a0yj/QuoqnIVDylUKN7EK4h6eIMoqlKCnPHCgyZQ8wEDXh0k4QFYtVZ1glpz6I6vLh8hQGkLiD2te6reIBV2QeLSK8gGAB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9235

On Thu, Sep 17, 2026 at 03:50:33PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dts: incorrect reset-gpios polarity contradicts hardware description
> --
>
> commit 3fe00f46f78811d6ed3d86dcccba4b6f6cd29139
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: imx8mm-var-dart: add TPM support
>
> This commit adds device tree support for the TPM module available on the
> Variscite DART-MX8M-MINI SOM.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> > index c7a9eb23e5e88..953950e55bf99 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> > @@ -138,6 +138,16 @@ &i2c1 {
> >  	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >  	status = "okay";
> >
> > +	st33ktpm2xi2c_som: tpm@2e {
> > +		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> > +		reg = <0x2e>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_tpm_reset>;
> > +		label = "tpm";
> > +		/* active-low TPM reset line. */
> > +		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
>
> [Severity: Low]
> Does the device tree polarity match the actual hardware description here? The
> GPIO_ACTIVE_HIGH flag directly contradicts the inline comment that the
> physical line is active-low. Standard device tree practice requires the
> logical flag to match the physical active state (GPIO_ACTIVE_LOW).
>
> If this property is parsed by a bootloader (like U-Boot) or a future Linux
> driver update, wouldn't the reset line be driven to the wrong polarity (high
> for reset, low for de-assert), potentially holding the TPM in reset and
> breaking device initialization?

tpm_tis_core.c have not parser reset-gpios. ref

static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned long id)
{
        struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);

        return gpiod_set_value_cansleep(priv->reset, 1);
}

suppose it should be GPIO_ACTIVE_LOW to assert reset line

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1789659585.git.stefano.r@variscite.com?part=2
