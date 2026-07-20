Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BA33B5841;
	Mon, 20 Jul 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531031; cv=fail; b=mS2earNVBZYOKnQ9M+Yf/olk6J6yqDG52H0WSiqqp4pfuk4F5w+Vaz5yLq3/iq2WKuZAEs9mBlJ5qj3W6z/6iTS5VmuQxd4WUoRA/jk/YzuDJxCUNLJ5aV7B5Mt9GxF8Isnus0/n0iyC1KWa8FQnoXbUE7r2l/kFiTIm0hpe1wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531031; c=relaxed/simple;
	bh=gOquY9WKjrQbtLrbKl0/ZmIrQB0m9otrxabVa0oKqJY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aWWyUoNo1EOIBtXkbCZyJ2GxDR7PMZIgLNaLuL0yWR9H4EuwT6i9UIMLj5qCPYbkb4MZID7lTbjTwXRqWYZer2cSIoqmMkupZYkPcvunnLFPHFZ7N1rb9GVOfvoGnlRJDMNZnHP4U2uF4V2lkPMa8uKGarF03MFSh9XcvENZNio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k+eK/sco; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k+eK/sco"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvw/cuLC3nOa3tsNwEGWwaUBoRofYkIy5hsZsdaQsqAfYGpeyC0kJKL+yIqerI+LVStF61By4vm1ZOEwFfhWSE3sYZxPe8pNf1oDLJX2zJ5n5olk6/VHuawpnfMdfCUoCkMXXERDsFJaTKSfQPmJ3DrzIvbxTFvfYImuLAgyno9iNf/aBLNovSOJ0qkAtaqZAxuusDfTZeyxOEu4Och3pxnjbXcwsSTzaS81tALaaNsNRy9QBhbrWd4p8pyo8tHGGv3QyGwjwvjO4zgnRsiGsGEMyHc9pvhBanKxKE2JoUCxurtuwjEZDLWA/S33ycZMBcLvsxONyk+oTdbrLF50zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv3hhcchwFEe/oCVFIjsMQRWDQg3uGJPWiJAnEYWIMY=;
 b=gA81L/p9JcU5pXdWbu+U9NjET9a2LFNlgRjmlZrPoixXVPEDjjnG7kulR9CjS+BGPZmBxewDaQQReVH0xjmQEQR7R/kljuv6JeJw8nX09fZ3vhXGuCz3z79EZq4emUrxIpUEYoidthhAcgc7fg8WL0i+1fNyBzhMp/EY/DnCzG8ojw1Bz74FdWWfQkt/GOaUDTyYtDRXAs87h79hL4E8/OrKzEMDO4JYnxtVtzuG2Um2VDZlMBtUHMRN25UdVRZAUJfrU4mLOfG1L/XY4zmG4oMRQWheREW+Nx8cEaCA8ItCXaefm5E5adEhCzm7E44tMfa8ZQw391R4wtgOugvKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv3hhcchwFEe/oCVFIjsMQRWDQg3uGJPWiJAnEYWIMY=;
 b=k+eK/sco6m4chneBXKTyBkAFVKJKmDEr6NCbiS2g2o5+ikbPnbuLfdx8QRvsKqbDCiIZqqRJBUH0HX1lFGyARtaa6yNo2g/O18hpnUrCPvdu420UyDsJUeohkJ4lqFa2YwVolBSxxHvJo3KgczHOb11kn2GykcyscT/qkaRN2/GXXX/6MsI2QPEEXEoy0Eu4KH0g2yb+gTcXRLRunOK66eQt+AQD7ls04R4SfvT65q9IfmT9mXDUKk1/A6O8/PsPtXtKjCBkWhYVPmEi+/b9sHePTrWshCg626Fd4Ib0T5kwkVEs19YWrbY4tDb1w0rzfKKEATGtQGp5kpQ0iBxRxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by DB9PR04MB8480.eurprd04.prod.outlook.com (2603:10a6:10:2c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 07:03:45 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%4]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 07:03:45 +0000
Message-ID: <56975936-9db1-431d-91a5-c038dc16c196@nxp.com>
Date: Mon, 20 Jul 2026 15:03:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM
 Board support device tree
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org
References: <20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com>
 <20260720-imx952_frdm-v1-2-6d145eaaa5c4@nxp.com>
 <20260720065549.C24301F000E9@smtp.kernel.org>
Content-Language: en-US
From: Joseph Guo <qijian.guo@nxp.com>
In-Reply-To: <20260720065549.C24301F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0114.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::11) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|DB9PR04MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d7ad5b-9d15-43f6-dbe4-08dee62d09fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|4143699003|6133799003|11063799006|56012099006|18002099003|22082099003|4133799003;
X-Microsoft-Antispam-Message-Info:
	ghbVDjVwB9Z+28NsAa4iUBtzGko1sjv0LvepGCbBiBoJJS4Svhtmfmsh1852YPnGKRJwZZmbKiDRRt22bSq2vI2/691Ezg8GSMgF/GXHaWDoU8QQ9D5yGmNE+Jjh3rnAgMgO/5zJm3RMkRwsbaiD5beMHQ0Tu8PwsM2nv15NVQXiABIEXjxgzYujuhkXEIVYMER7MMkA9sZ3Y18W3Uu+epdBkaykmRcfiSQ8H27YmzEpOzoZX0PxO07IJozCsDfNnKBVbrgRejUAeSmvvNLd2i3GNDP8tgpBuGO2kCSQwyEU6396ZsgWw1cOxsSo+QuB7HEXQ62YCZQJZ5zvVlE7807XJFe6XFB0BchjW/UIqYjB2fWvkTENb79ID08OUy6e8jCm9x1Ty0g7g7QEim84ipFqvqbo3bG0XYhld9qt0xfp9APOs8GJRY3gUeeAcRKrXNott2IIWYbcv/QroqYJ63p8r6FppR2KDRFPESH58lMtV33GkKoFkSTiBo6cCTNY+xlB419V/f6ruE3QKBbG1MwChb5pLo8FU6ob2wjqwe6boX5AFPEOU8WX5+fMkSz/ZE2r4EtJ8ILRnMudx4uoGDn9lvi7R55H67Hl43L3+lE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(4143699003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhTaVdBOXNEOGlyR1BaZUp4UlpBMmo0ZVFJQVRqQndxaG5iM3dVeVc1a2I4?=
 =?utf-8?B?SndFdGNxL1dKVWFqTjdrTDRZcVplSU9zY3NKL1I0dmtxYWZRV21tS2tYT0FW?=
 =?utf-8?B?Wi91S1lRcnBzQ002cEkwRnFGY2pLVXcxSHIxd3hJVTByYkVVMHZkKzZQRU9P?=
 =?utf-8?B?R21nWHI5eFhhNXdxMnArK05CKzUySkJHMjlzNHRXdExqTTBlMmoyVmhUbHZm?=
 =?utf-8?B?YklLajNPTyt4Q3dKWmJ4RmJ4RzRZU0FoZkYrbjZUUnkxNEdBWWFuV2tZNEh6?=
 =?utf-8?B?Z3NaQjlIWE9PQkdiVklIQXZ2d25scEJsVlk0dWRHRHEzMlZQeGdRYTBKUW5j?=
 =?utf-8?B?L3NBdlNuYUdZRXp2anJNUWN5QW01V3VzbUltYWJDN05YbkJ6N2Q4WWo2d3Ey?=
 =?utf-8?B?WEJ0ek1uMHpzM2tHVldVVnlSazBiUGhwNUY2ejllWWw3NkRIMlB1NWs5d0VE?=
 =?utf-8?B?N2taSlFoZllCVEZwZHpNaFBqaWNtM0ZDZ2ZqWWJEOXhrY01VMEsyTzlCVmhM?=
 =?utf-8?B?RjFvR3ZGWGNsQkpMQ3pzdm9JMjBOMHdtTU9zRWJHZmp4ZkZTN2xGYzRHUDd2?=
 =?utf-8?B?QkJMSEovbVdRcGJXNHNKS0dEU1ZneS9SVjFyRThtdGZPRWo4dy9uTHc5TnJY?=
 =?utf-8?B?SDV5ZjdZckdyRWJ2d2lROFZuRUZ4cVpVQlR5b1pMVVh3cnV6ZlUvZ1NRQmpS?=
 =?utf-8?B?NDFFc0M4dGFKZzNNOGNxUEpWWHBJZE9IVkdrdU00bWg1cDgrMXY4MWFmMFNm?=
 =?utf-8?B?bG1xWVdXVkJuL25CM3p2b21ibGRJRFBVdlhrcGRsZERsaTV5M0k3RTJvS3Jw?=
 =?utf-8?B?djhHdmczelRWZ0YwY2RVR1pEV1U4c1JmVWtxeDNWem5OaDJZeGIrYlorUERz?=
 =?utf-8?B?Tld5MDNVMnkxRmM5WEhsVFAyMnl3djU4Z1AyOEZFU3VjVFpZb2pmNldaSVRu?=
 =?utf-8?B?K2lBYTFPTG1zZFJDamNjVUYvcTUxUGduME5ZTy9UNmVNZWdrNW94Rk9BcEZa?=
 =?utf-8?B?Z1A4Y1ljY1kvcGFBODFuekZ5dmlwalJQM0Juc3drOGNDTWxEemJyaTFrY0Ir?=
 =?utf-8?B?WEg5ZVBsb1RYa0h3bElheEI3akxWUldZZHNYbGdGVFlDY0QxWVRIT3laTE5s?=
 =?utf-8?B?VzB5NTlINXJ5aDRVMFV5WWdyQjUxelVpenE5V3QwY2JCRkM1V0YrSjV3N3RY?=
 =?utf-8?B?Kzl6ODJWZU9lR2hITUl5QXhZQmkwbUNmYnRVd2pOTWU2WGRWS1pMdm1WYVVp?=
 =?utf-8?B?Ym1URDFOMXNyWE4rYWFTdmgveWtXZ2FpVktCWk91RTI1Tzd6aUFwVWZaZzlm?=
 =?utf-8?B?bmJYZXVqNk04R0Y5cVhSZFJwM01URDVqY2ZZcE9NMnRpTXl2dGlWSVJ5NzM1?=
 =?utf-8?B?dXVJN3NRQy9aZG1kTkNJRllVeVZDMmh3MFJhOGM0SldVRVZ1TnV2VzRHVFBC?=
 =?utf-8?B?T3Iybk5oTWRIMVEvaTFCZHVCYnVjVFVzV28vaHB0NFk4N2J5akhQeVEvQlZD?=
 =?utf-8?B?MG0rZ0MyUmJrMkFNOTgvaUpibG5mTElJMkJIb2FNS3E2d3RwUnVjNmF0VUUv?=
 =?utf-8?B?VHV4S0lZSm9BMytoU2NKZHRBbGNnNTJHblVDeGEwcFhldjNHWDBKcnBWRU5i?=
 =?utf-8?B?YjRxWkUvWXQ5OEVWdnJaQk4zOEkyRkJON2FWSkRSTmI2TkcyclVjVCs5dlRT?=
 =?utf-8?B?WkI5YzVTbEUwRXRSazhiUTJoTnRNOHZGengya3Z2VHZFL1lQTlZnSXJDRXFL?=
 =?utf-8?B?clpvcUlML21sVFp5bkJkeFZyZmJBMlZ6ZkZqOWZUUWFoRFkvVmlSbTI4emg3?=
 =?utf-8?B?dTVPQzY0QmwrUm9FYU53V0ZqenZLTFV3N05yUE1GZmVrQnRhS1Nmd3owU3Nq?=
 =?utf-8?B?ek1uU1BJbDh2bnRxNGNyaWdQcnVqMnNKNUJUaDNFMVpEd3JnajkvaWllY0NV?=
 =?utf-8?B?YTJjTGhsN3U3Skt2SjlVQjZFNURnRUc0U2ZTcTgyc2hWWlFLWnlXejZ5VnpQ?=
 =?utf-8?B?cVVEbGptSlFQajlvYmtLbHAreTRRZHgweXZWV0ppVUlnMDFtV2gvU0pjYTlY?=
 =?utf-8?B?UWVuc2RQbENnZ2hzQzd3VVFPbFpOSUZDRlhUZG9SVTJ2OXppMFhKZlBhL0dN?=
 =?utf-8?B?RXNBUXpCamJud3ByaFZodXVoNFdNb0picldta2xiSkF5NndCdUxDaGdjeWRT?=
 =?utf-8?B?MXRRZkxJK1R4TjhTc2JlejltMVR6UjM0S0dvTWtKVTd1TTBYWFZuYnlaaTRr?=
 =?utf-8?B?QXlDWEdjWi9zSFpRbjRTN0V2QzIzcTZCRDFSZEJ2cUtoSXYxNHVrMEpveVYr?=
 =?utf-8?B?UG9RT0U4T2dHTmlKVU9vL0tyY3QvY1Y4YnJWaHNpT3luQzFjdWdOUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d7ad5b-9d15-43f6-dbe4-08dee62d09fc
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:03:45.1236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0JNmTnDGD/kDWEyvQFxfxjlI8sDDcfy/EEZTFBghmUU9MdBF9mwqtczXa5Mfe8nsApKvQZrgfkZI1WDc7ULZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8480

On 7/20/2026 2:55 PM, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> 
> 
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Shared GPIO requested exclusively by two CAN transceivers causes probe failure for the second transceiver.
> - [Low] Use of undocumented, downstream-only device tree property `fsl,cd-gpio-wakeup-disable`.
> --
> 
> --- Patch [2]: [PATCH 2/2] arm64: dts: freescale: add i.MX952 FRDM Board support device tree ---
> commit 8bbcb28d08a05e0f4c57023333492b4e023f7caf
> Author: Joseph Guo <qijian.guo@nxp.com>
> 
> arm64: dts: freescale: add i.MX952 FRDM Board support device tree
> 
> Add basic device tree support for i.MX952 FRDM Board. The board-common hardware
> description is placed in imx952-frdm.dtsi so that it can be shared with future
> i.MX952-based FRDM derivative boards.
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
>> new file mode 100644
>> index 0000000000000..b9ef6bec2bd5a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
>> @@ -0,0 +1,727 @@
> [ ... ]
>> +     flexcan2_phy: can-phy0 {
>> +             compatible = "nxp,tja1051";
>> +             #phy-cells = <0>;
>> +             max-bitrate = <8000000>;
>> +             silent-gpios = <&pcal6416 6 GPIO_ACTIVE_HIGH>;
>> +     };
>> +
>> +     flexcan3_phy: can-phy1 {
>> +             compatible = "nxp,tja1051";
>> +             #phy-cells = <0>;
>> +             max-bitrate = <8000000>;
>> +             silent-gpios = <&pcal6416 6 GPIO_ACTIVE_HIGH>;
> 
> [Severity: High]
> Does this cause a probe failure for the second transceiver?
> 
> The first PHY node successfully requests this GPIO line, taking exclusive
> ownership. Because the phy-can-transceiver driver uses standard exclusive
> requests (without GPIOD_FLAGS_BIT_NONEXCLUSIVE), the second request for the
> exact same GPIO line fails with -EBUSY.
> 
> This prevents the flexcan3_phy and the flexcan3 controller from probing and
> functioning.
> 

This two CAN PHY did share same pin as their silent-gpio on hardware.

The same design on i.MX95 15x15 FRDM. This should be fine.

Regards,
Joseph

>> +     };
> [ ... ]
>> +&usdhc2 {
>> +     bus-width = <4>;
>> +     cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
>> +     pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +     pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
>> +     pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
>> +     pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>> +     pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>> +     vmmc-supply = <&reg_usdhc2_vmmc>;
>> +     fsl,cd-gpio-wakeup-disable;
> 
> [Severity: Low]
> Is this out-of-tree vendor property invalid in the upstream kernel?
> 
> The property fsl,cd-gpio-wakeup-disable does not exist in any upstream device
> tree bindings (such as fsl-imx-esdhc.yaml) and is not handled by any driver
> code in the upstream Linux tree. This acts as dead code and will trigger
> `make dtbs_check` validation warnings.
> 
>> +     status = "okay";
>> +};
> 
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260720-imx952_frdm-v1-0-6d145eaaa5c4@nxp.com?part=2

-- 
Best Regards,
Joseph
