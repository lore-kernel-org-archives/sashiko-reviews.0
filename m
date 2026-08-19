Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DAB44AB80;
	Wed, 19 Aug 2026 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153633; cv=fail; b=KP8pVg4ScvvegGYWAc/eKg5nBTkhcOyRQNWfGBf/r+G6tieGRzRGTqcBp5xxOPAc/zZupfqhqjsVDku29J3N9JBQXRk+fyXR+pRQ9NTAtBgFkMcHLS7MmaZH6gviflJEKDuFL0Cc6uORpDSyjjvAAzMYdvsJcLJId00OJZYjiTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153633; c=relaxed/simple;
	bh=+SKscHdzTVESPUmKPr0vgH9yPt3Bzvx9foQuM0uDbmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WENE5k2uTZxbiJBCyLi2uSAVhaEYmTee4jOz0uuYqr8BDHZvfBPV8gjqA9tcGlTxe4PY9+f2drSiRe4MosnnCOYCmkQ1NJFtYC2lFB3TcL7JkQuCKDdkGHQmaeMqVsYACGYjsP9M6RWPWfs4bciN0Zmo4U326ZKSZUVgHIpGViY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bV0faWWn reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bV0faWWn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1zpDnj2Jqqtj+KgT+ZyUy3s+xQcphEAfHvNXYeUH6KCc9TVzTe9jdRtk9vs8d5MMzSg6AR+CqcUshEAAfEM365AMU7o8SMQeZopy4LeHOkAirQsfJN8sn0TmDG6zxGLYSDkxFGL/5REcmj4oOYK/+yhsqPtTu9j9KgNeZ02Gg/I/A4cqHfcXT+wKl1x2a0tZxd/NyOq6xQXIAiWE+4aaJeQljnQNJ25WRArQlyTvlnPjpELoPfL0YXls0rJosnLxx46gA6sWxpweqDmQzSUxaiE3wMjR36++zATMXekTEhf+M0OzeHMg2VB/U3fECSGLBuO4jEkNX3T+WvA5e3umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqhCk4YV6weDHhFFxA37xZdd/It+U269AIl0AcxXpJg=;
 b=Zk+3Gme+vdc8gzFG7FcmjLntwY9BXxglkMa2rtwqDvIDJkG+VYMrAEkbfBOpCz4VT6jdUS41tLY6xZMoO7rDa/6UamTkqrOgqPsvxFMl7fU1II+1ChTPXpcAmRz6/r/G7F5t2YC4Fqoblfbl5m3dveI7kuaPEU7AjlCqIfDy/VpmO2PgwMtRhu2rfI6In4n0U6SRn7cK/XhzqMVDEwuAG+Sweqgel45+Ll08Oz4koXVoLRlyGgPQqQFPUl43Rdfw+rlpSqCeBvyPcVmwByqglt+P35AnSLxXyniLL+KxenkZeW8lSB5lc7XqPs9OqWfkjyAv52C6H8bxnWJhIQa9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqhCk4YV6weDHhFFxA37xZdd/It+U269AIl0AcxXpJg=;
 b=bV0faWWnnvRTzp5LSjuCJ9wlJfm+x8CVR6EvFL/G8afrLc+Re4zWfJwv3rudgCC5KBbcVq0wamiw8mEevKgSiwOognW5Axlls41EcNna27NvYDYzyZSpB25jHQJwhMKitXS9kq56ZR7OBTKBbWbMc0er9rZ9/AInw1Y+BBipDiEv2sxR0twtbybgPnYuxoOjAndI8q5hK9RI9zldqtwR88im7x/ZvUWF/IYDuFd2LexO9tlSe0AKTJp+cPO6AiMwfO6JX2jpPusbivEO9iN87X+xQF5tRDfExxCZ1YCdTNSWEgBlj9uybKE6iYidlL+WGci72IPllNkcgbjPZV7BQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:33:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 15:33:47 +0000
Date: Wed, 19 Aug 2026 10:33:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank.Li@kernel.org,
	robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp-evk: enable CBTU02043 for USB
 Type-C orientation switch
Message-ID: <aoXM1M8bORem3yFJ@SMW015318>
References: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
 <20260819-imx8m-typec-v1-1-befc92ecb70a@nxp.com>
 <20260819150403.1303E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819150403.1303E1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7PR04CA0240.namprd04.prod.outlook.com
 (2603:10b6:806:127::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbd88ed-df54-49d5-3ba9-08defe07427d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0rnoWweRWUncMMSMSWkjl8s0vWj/DjOnRPAVOZDyrz2E34u7X86lTZ6vhN4zhyDi9dZZzRz5mTRpeDSuODtRN/lEK4/Hd9SR2E2jztYJmJrXQ9pkuWH1i71L4XcL1f22SKO+pJW354g7wfSZX4gFJWPmhQ9w+ECDx2e7wNvED6Tt4qSHUUUebeTPW+Y/QfYkyQDXYxdIpR7jsdFDJKbbtziYcc8r5JTLWz1NaAkt0Pqw+EhF4hhCeIJzyFADFrVArUq0DDC9T+P9Lun0LDaKnqOysdY+SffRdeRp/aAG5Sk5t28P55GVAPmY4kixBoxcxoKQMoKzd2cNOQTYVmmJk2NwnJXYYZT8DYfck+a0YVK7iZFr2xmfUaRQk14ZtXRVOHEj0wU749gCTYKOYMSLQaWFRuF+VtID7Io6paRPAoDgDEPVjaBPge8O9jApRjlrNFnZWvT3jwPDYHY4S/s/Y7u1iSrhRE+89DHmM23+RvDfXjUazXQqUxvxs0OT+/wBjm967wY9ytHRDoRKF0uLOooa7pFZNfiulCPa9G4rFhfM1/lBKjmQ8R6B4J4zLGsBGo/Qit81yyjOKbBqnFK5h0HRx4fSVU7k+lMs4ZuI+vk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?n0HnFhTZLfs7VbZbPy+qBYcV8/LpmKIBPf0cokX+RqYIdsVhRMm9hMvXOO?=
 =?iso-8859-1?Q?mPBDvr2cFE/eV0NiPJwyHj7v3jhxSyW3m+kkjOvn/VCuOevuuFolJXazCj?=
 =?iso-8859-1?Q?iP76d+m31Qw3FHPQI8iHupJGwQ06lL5ypS4ndustd6AjLjUimPABOGMVv7?=
 =?iso-8859-1?Q?RmWVWlTstVfZ/ENKckUx7Ou73l717QRoS3jeHZI923gzHuBYuhr6UU+0cF?=
 =?iso-8859-1?Q?2RyeaI50q7d3Tk9MywR5xm/khBIj1kBtKA8R+fdafI9jlG8HZqpfCaaMVK?=
 =?iso-8859-1?Q?uW8IDFI9KYnO/XcNeeOd6V17kinar/tEr0NvT7UzYAgWIkAryJnT+8DY8k?=
 =?iso-8859-1?Q?OlddOGeYlylKcUN/4OUT/VopJkegnC8jX+OVr6rXOAZA0iA6XXWvmc2cKs?=
 =?iso-8859-1?Q?yInsYuqYiScJvczTq0hmiFD+9JIjLj2waSA2M/JA3N6jktbkcS1rPKX7T8?=
 =?iso-8859-1?Q?SlIAvcVLa6Jc/AotYHeSWA5ZMHCAe4dA/aloSDDIBiaYtkie6vcJc9df5q?=
 =?iso-8859-1?Q?TXg56pcupLC4ZDtYKsV1Vtr0s0GfCD0jKhx0spPMxG1Xj4WmB3HgBADZiH?=
 =?iso-8859-1?Q?zk4F7j1oxzG/05iKo8JhalqlHiYR0+UGLSqtw1VIfB/QIuySQyE6C5go7a?=
 =?iso-8859-1?Q?eAMn+JnpNm+YogpKkUbvnUH+DQ/hlAdDauwZuHstZSSACtO86QT78qOaIc?=
 =?iso-8859-1?Q?wvqwEfQByr4yi3xDpouIIC6+k4c5BOgZoKvg7HyyGqc1M5OUdI05kmNzXm?=
 =?iso-8859-1?Q?y+vUTaOYyFnTPBPp0k6imPRcvjFrryUwH98ZCHGw8z9mHBLqeKo/WKyIgv?=
 =?iso-8859-1?Q?qQUN5fbmxU+otkrj8rAO8BRLz9LJkglybjoeVNO+VG75jIu/nyrHq+IJrF?=
 =?iso-8859-1?Q?FHAxQgdD6P79Y+9bMVQ+J5+VaQ2zvhdjM+sdyNGiCPyuc3yVxwiVxzTM1t?=
 =?iso-8859-1?Q?zWgV6h7I7dXX8yJqaOzfNmcd7K8zBIWiRQt30gINJso4NDmG8EgKrHoxvQ?=
 =?iso-8859-1?Q?5qb9MB41IIzNBTKJE7Asm7Z/gwp1V2kcYynAPXiDLkLbUbF6XHr4uviZuE?=
 =?iso-8859-1?Q?jejeljiGFCfGCvvNb5hXIOc6SZDC6Ey+DnbjfCSA9IJw8y2z+p5DUlhAos?=
 =?iso-8859-1?Q?bzWVp8dxZ4w3opRwaR7igSYOKQ4mlOoHZgxcHIX0zO+GX3Q5Bga+x2vLhO?=
 =?iso-8859-1?Q?Hm08p+3mjTiBtL8o931x9oPKuuau+Mdc7gdI+dRzZ72Un5IdHul78rkfmA?=
 =?iso-8859-1?Q?Gvy5tnLbzpySsnQKQQ4NZABuopskO1R/AOy6tne/7Wrna2QTFIuseinwW0?=
 =?iso-8859-1?Q?JK6sj9LcxcwXgFbc8wzKoKmQA3V7MBe61EU5DjMyojk1efNd4YmdjtcDAr?=
 =?iso-8859-1?Q?xgGYIm9pJXMgF3DkJbXfF6mIQiYLW3KdG89tsxT184OVh93YEEM1n7+lio?=
 =?iso-8859-1?Q?xKuCd1G9Y4X7ReZSLbmtdPxEIUfrhQ4YBpQDHRQSCkOFEayGJWzTysJnvE?=
 =?iso-8859-1?Q?hYRt1HawG8IPaM3i9jWAhWxvb7xM4/A4u4bCpCuVRxzFKLpNS9VPtrghj5?=
 =?iso-8859-1?Q?xAMNMOCU2ZBjGY5ZNXjVDT5ui4Q4SbhgG2QMMy4yYgsoqQPr7A83btoOCf?=
 =?iso-8859-1?Q?D1HV7IlMZwQbNf1KSJBbhc7+M1/zX6gNmNjVFHjU1xXToWcmx+JagkPXRp?=
 =?iso-8859-1?Q?qjWH6Yzm2b1GKClaPQkQ9z2S77xQH+UTT1/MAN+OcrbI42rFt0E55yQVDt?=
 =?iso-8859-1?Q?eqPM28YdiYYdw5czPLLz2R4NytPgNpNoC/tJa4Br+WLJqUEOBAxWzSRWzm?=
 =?iso-8859-1?Q?KzTmrE0KnDxbzZCYC6yz59tvbAq4aa0sXIQqylqcRJMGCBh4V4tv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbd88ed-df54-49d5-3ba9-08defe07427d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:33:46.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps8oZ5BYdsWupBVfhxPBZJ66pVlgZUpJ3UH3fNrgh7FQ00gnaxG5XBDgg5PK9Un76TMaNi6qBsEuaM1aiHgNfARG2wZouHCAKJLtH1TOGFAsQP+5mryUe1i+RgwG7snw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852

On Wed, Aug 19, 2026 at 03:04:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The GPIO hog for the CBTU02043 XSD pin incorrectly drives the physical pin HIGH instead of LOW, placing the switch in shutdown mode.
> - [High] The `pinctrl-names` and `pinctrl-0` properties inside the `gpio-hog` child node will be silently ignored by the `pinctrl` core.
> --

both look likes make sense.

Frank

>
> --- Patch [1]: [PATCH 1/2] arm64: dts: imx8mp-evk: enable CBTU02043 for USB Type-C orientation switch ---
> commit b6ef05965c4d69ccad672c2aa85487746c77918d
> Author: Peng Fan <peng.fan@nxp.com>
>
> arm64: dts: imx8mp-evk: enable CBTU02043 for USB Type-C orientation switch
>
> This commit adds a gpio-hog to keep the CBTU02043 crossbar switch always
> enabled by driving its XSD pin low. It also adds a pinctrl group for the
> XSD pin to ensure it is properly multiplexed.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index 7bdd641292fb6..dc3baeac5e3d3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -935,6 +935,17 @@ usb3_data_hs: endpoint {
> >  	};
> >  };
> >
> > +&gpio2 {
> > +	cbtu02043-xsd-hog {
> > +		gpio-hog;
> > +		gpios = <20 GPIO_ACTIVE_LOW>;
> > +		output-low;
>
> [Severity: High]
> Will this actually drive the physical pin HIGH instead of LOW?
>
> In the gpiolib framework, "output-low" requests a logical 0. Because the
> pin is specified as GPIO_ACTIVE_LOW, gpiod_direction_output_nonotify()
> applies an inversion to the logical 0, resulting in the pad being driven
> to a physical 1 (HIGH level).
>
> Since the commit message notes that XSD must be driven LOW for normal
> operation, should this use "output-high" with GPIO_ACTIVE_LOW, or
> "output-low" with GPIO_ACTIVE_HIGH?
>
> > +		line-name = "CBTU02043_XSD";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_cbtu02043_xsd>;
>
> [Severity: High]
> Will these pinctrl properties be silently ignored by the pinctrl core?
>
> The pinctrl bindings are evaluated by the driver core via
> pinctrl_bind_pins() only for nodes that instantiate an associated
> struct device. A gpio-hog node is parsed manually by gpiolib as a firmware
> subnode and does not instantiate a device.
>
> Does this mean the MX8MP_IOMUXC_SD2_WP__GPIO2_IO20 pin will not be
> multiplexed to its GPIO function, preventing the hog from controlling
> the actual physical line? Should the pinctrl properties be placed in a
> probed device node, like the parent &gpio2 or &iomuxc?
>
> > +	};
> > +};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com?part=1
