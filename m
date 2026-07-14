Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C263E44F0;
	Tue, 14 Jul 2026 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043234; cv=fail; b=big1JHlds4b6R+NkQKDAJuvo0D/8KS70JAlKnQPCKb4jNkjqkT0j54fawAioJXNeU/bbBfQEfeHpUMyQwtteMl4Z8JWF2yU9UFWTLqalGsMjlwSuoqcCtKWovALmU8jY8jPJJBibS08tCgSoR92jPYwUta4MfCXiaUcHmyeZ1wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043234; c=relaxed/simple;
	bh=1evsgDy88HL9frqFS6DDH5F/0DL43AWFKxf69qDEYF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jXo95oHEqPhfBY4r23g9mP4gNy4WdY9u6cfE7vC57rEwIlE/Q0jbS/KUFzMsqFg/uhfQt6fZ2fzngV8kxJEVgBvnUfJuxNS7khZb+NMyRrJH35PMIhkkod2Q+yqYhB1mqAHgYpXPRlSaGNFITUIykJbigQElULkUgker+wOA6XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eRy3DeWe reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eRy3DeWe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilI2NreHQRvHwLIIc3n+Eimrn5VLq9LkryKBLMuFO61PGHXbpTrdjzvPvgeAaDM9Wc5UF3KNz0zKfM8S+PT17BztghFpmwBnuSAw8XZlSH4OSe8t9Z4u3QFHahi5gO/hGxoVYK/Rx6nV6URV9gYdvIoFHDQffD/fAc5m4wnnKVa8ksUlybK0lacDLrzQ5SPuRCEubr616atiGxlS8QixEAP9ICXnPdlrr1rvoe4x3PIsgRuayRa+Uo4aj+Get+Li3Nv52PjF1yCh+Cn6vLhkHlFSlRnAvEn/9UpN5Evu/4stFaB9hosIaWX+HC0tiSZ9/Gb97MVgoOK6RXBB127qMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d32Pdjw1oaUKaMA65QIAUnomqhlPke0ZLfZ06GH2NM=;
 b=PscPwCYFzzlwEb5bEqa63NzdFkulaJiDojoWfavtJD6IbDjIeTcmHxxj2SOZBhm6JEcePNLJnRwql6aV0d+yscOzKI78UH31eiHsIiSscdlw4JfubQQHBU15pMYQyGTopHqx7mvWMYC+UCbiDRajid0tnGX91vYEOuk4A4WCsi1pO9yr20lYfPVh1k8Bu9fE3zSj70ioDgFR1PACOcqk1oJj2wQ9LQI0YGHQgoHHd/5/urHA11OiW6C2h8i8g9mpVfgqQy0NzNbwvm/ghwJlobTnYKXAOBKKwZsXEhl3ypkewQFeTTv/wzB19G7LUAjjE/i2sXVVhBoBoOgn6UwG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d32Pdjw1oaUKaMA65QIAUnomqhlPke0ZLfZ06GH2NM=;
 b=eRy3DeWeY0Iuekp2S/1NHoBndrMtBoRxHZuuNoo8W/C3s+unI0ylzT+Lt2EWsKqr8lFIuNE5znMI75/HEdRg6rKYr44Q0y1QbB3bjh/dtGfm790XgT/RJSCUU+KTj8/3PkTpsdw167k340aNoNBPj7R73Y7U4J2x3qAM7QZDi8Ndsg7n+KxFGzuG4PtdJjht95C/+CzzofBuy64psbL/gFz1aiQsr55KylmJ3DHKWzeMC/aQhAZUkOZPBFn5tlBfpeRWUdUR8az1rlpxcjFOlHnHW/e/eRuzPbCXvL8JYLCjNBqOkNyXZuFxsMyDH4NlzWtxa4Nx3zMpx1jLORupuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8756.eurprd04.prod.outlook.com (2603:10a6:20b:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 15:33:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 15:33:49 +0000
Date: Tue, 14 Jul 2026 10:33:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev,
	conor+dt@kernel.org, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <alZW0l9rJpn8L0Mh@SMW015318>
References: <20260714143154.787825-1-alexander.stein@ew.tq-group.com>
 <20260714150126.09D971F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714150126.09D971F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1P222CA0181.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f74492-7850-472d-f2b1-08dee1bd4cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ou25nI0OBxpIJdlJ34Xka94K04WCyRU8VrJC1vFsNI6uqqpChkTupc0cWRnL0ULRiHi8ouzX88UH15M9Z1EMymBLkzuBnKUn17cYNTO4voiQ0bQGr7uyMp9wRICwBWYz4zZ0LDKgb1+TTASWrR68M/v7Q/le4NigsLFN2UXqPVtYHVlLzh3uLhhiNGeBHyqkBviym2tLNtv1kD/uv1p7whqLAgYNyl/WWPosy2DfNwaS0A4NMIf88OVZPIZXOkNEg67XkcHLLgmD9xu+DYWsl7Xqjb7GHS0pRF2Mxl+kSaHMsKOkcKpKJDGKR3znGOiZXh+EXcfqCXivtrXiRK/BV4X7KzoYr3kxtLGHsM7w1/h+YJ5bhrwx5Ff3a5B7yEBOwO77fFpHqzQ6z336asZ1Guiw7nk3xa1MKhZURnteWH7PV/xI0ZSISdZqzV0v13XQY8bJJzQwQWxPq6IRHAUiZkHJgzRiI1PBho5bIAgSBha3zWl3OIN9ZiVSs4K5qpD2kehsD8N99Qz7z7VjlRMhrpRy0rFbug4cGVBAn+PFMScKum0XTG/ggBxr4o3lX3/L2iXC1FjrZVMxjXJtfayEEkpodJOgF6PQI0XoPgLKdMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?59kc9KlOYSjKMPloftHpPs+hRMR2hq94RLneibu0oy6HWtwIdYRw6uqQVp?=
 =?iso-8859-1?Q?ROKSB3eiQYDPBcoTyr6l6QxIfw+rIeb8Q3Y1uMEJMsty6+8vb1ydocr9FR?=
 =?iso-8859-1?Q?XTRAOeCEKXh+/JVLsLXdmVevuAG4Zs/SDwRRpsbZyOP3cf4CHrrGPy5SO9?=
 =?iso-8859-1?Q?N4zkbvi7y1K+QQuuMv2BSLxktbJDlqFeGhswP+8X/exVbyUWqFW58OzmDQ?=
 =?iso-8859-1?Q?JenljtciiOnUJw152EP2YR9OlKQ35rOa1IYwrvN+Rd5DEg20ZrHZSzQKHm?=
 =?iso-8859-1?Q?e8VM3e+m9mYRxdImrOgMw8TVihRKBVO2rU53xXVgcdoYF6HgvBZFxgTPVQ?=
 =?iso-8859-1?Q?BCXoypYDayrGOf2r0JIy00IUFC8W02uDi9HLjeWNjCaR0GHihjNd/6n831?=
 =?iso-8859-1?Q?an3AtDIgEwNfHray6qi5gnhYjl/Go6aoUJzKo7IzuZ8zK8iO60/HbL3Pas?=
 =?iso-8859-1?Q?cnbricLuVXeQYx59527k8J42kbQQr1jV2rEofazi4C6TwFWJJq06cJ/2F/?=
 =?iso-8859-1?Q?3WloYuVm6cHNnhBQ+vbCu55AgBRlyE7vyycx8/qbRKpwdWR2gC77FJb0LS?=
 =?iso-8859-1?Q?A6fkeim7s3Ntz6qevMYocU5O00p7or+wKkkWW5mKu+QRL/R0WHbifl5983?=
 =?iso-8859-1?Q?+DdKgCXJPc2ZXajfvaLVoTevSc2ObZSD3OXUTlx8iwujLKA+T6Of+ztjVf?=
 =?iso-8859-1?Q?TGqDlcrtcWVYVOB7Z41+KTQeNiurrYN7eg8cXGqw1kK+3Z11e7BPCEmafU?=
 =?iso-8859-1?Q?dqpoT0y82sQkQJE5OLZfQTfeAt2bI0dRwnh6rMvSIIUzlSVWE740BKfasp?=
 =?iso-8859-1?Q?L03nqRal/v3sunjioM+j9Sz40xElTroE2cACgUMLALvlRTjsN+vw1WPJDF?=
 =?iso-8859-1?Q?EHby4ge2wyBDXjU9d0iSqiWW032TfJtI9FAfmYqLMeo932LpIyJwpO0ptF?=
 =?iso-8859-1?Q?wPMCfMZ3mSsY20XDybAnWL7jImeLXZ+gFHMTGwCJ9SndmNl9Njx3U9Absb?=
 =?iso-8859-1?Q?TZgGNkDkuxku6AS5j2VkYdO+ckUnlFYW6eZTw9J2EfvMk1wFY0Hly+6iv2?=
 =?iso-8859-1?Q?O4TTY6Yi3t/ygqKhErVY/V5W2biGVfuhOnBdFLJCU1lte2aHYbdUK6HCTq?=
 =?iso-8859-1?Q?NhkpvrndxKJYcx3fuxcXxmCYlucdBNS0miSWXcAXOZdI3zaKcwCIgVn0wy?=
 =?iso-8859-1?Q?hqy7ZejpRkAEdl83nUd/VbQcXy5IvQeH2+uUiZRQt47onZZnNxSsZuV2os?=
 =?iso-8859-1?Q?cc5Q9kNemsN4noBSH8OjofvkCXFG/lWwqo3xJMT5BEDRKR0QqapofKiZiJ?=
 =?iso-8859-1?Q?Dv6ceOw/ej1fbpQqeLYrTeUxBTI3UUI4SNcmIBy5jiULOT/bOJaF1HPb+t?=
 =?iso-8859-1?Q?zODH0WPzMdAZK3tK1RLgaPpRuuIPRwv2hu3t+LmpmHDeLB1O3EVrsmWCtq?=
 =?iso-8859-1?Q?UdtfAGJUJyr+n25m59WrSGBZHUFNQU31b2BL9PjSrQhhJc5bL7kwCwdM7M?=
 =?iso-8859-1?Q?siFlWjIwWmHuYAfh/mE3VqfZbVRUHsSPKUMgk5DH67oi20608UHiRbyfOx?=
 =?iso-8859-1?Q?98szkd7BWBjblS3PFB1/H+HRtSTToc19D0Kc7+01nWyR8Rce1yVujtEmrY?=
 =?iso-8859-1?Q?BX0WFNHBAQJrFq6z3UK36W4cyVklA4TFIgJZbc8IKcxJOGG02cpMiPkfrp?=
 =?iso-8859-1?Q?Ivyy0MgGsF+oC9S9LXf0TGNL2iCOeqMWOglbkUgL63Be0/hZSB781Cwx2n?=
 =?iso-8859-1?Q?B9WCPEIA3TdQjN8xBp/VfqUr24R2gWyIcZNWTOID8bmk0W72qeOAixNfmk?=
 =?iso-8859-1?Q?EYp1kj0Kcy0NTLdjpKzivq2thuU6fBTSOuDNMVRrCAe6s9Yv6Y/G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f74492-7850-472d-f2b1-08dee1bd4cea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 15:33:49.1891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUzawnoB962/qv7XKfNWOG5efeNC8r0gczsIgyL7twHUh68wo9JWx3o9L6mR4D49ifgXyfX/T0tIwRTr0rzqIfqnlRtZuNxRm25QR+fdle+9cxV4S+IRZtJtQoSS/5h0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8756

On Tue, Jul 14, 2026 at 03:01:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unreferenced 10G SFP regulator will be unconditionally disabled by the regulator core.
> --
>
> --- Patch [1]: [PATCH v8 1/1] arm64: dts: add tqma9596la-mba95xxca ---
> commit b7aa596cf679be039938abc33965834ed28f5c60
> Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> arm64: dts: add tqma9596la-mba95xxca
>
> This adds support for TQMa95xxLA modules, designed to be soldered
> on a carrier board. MBa95xxCA is a carrier reference board / starter kit
> design.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > new file mode 100644
> > index 0000000000000..1d745d66997cb
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
>
> [ ... ]
>
> > +	reg_3v3a_10g: regulator-3v3a-10g {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "3V3A_10G";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&expander2 15 GPIO_ACTIVE_HIGH>;
> > +		startup-delay-us = <2000>;
> > +		enable-active-high;
> > +	};
>
> [ ... ]
>
> > +	sfp_xfi: sfp-xfi {
> > +		compatible = "sff,sfp";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_sfp>;
> > +		i2c-bus = <&lpi2c7>;
> > +		maximum-power-milliwatt = <2000>;
> > +		mod-def0-gpios = <&expander1 3 GPIO_ACTIVE_LOW>;
> > +		tx-fault-gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
> > +		los-gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>;
> > +		tx-disable-gpios = <&expander2 2 GPIO_ACTIVE_HIGH>;
> > +	};
>
> [Severity: Medium]
> Will the 10G SFP regulator be turned off by the regulator core?
>
> The reg_3v3a_10g regulator is defined without regulator-always-on, and the
> sfp_xfi node seems to be missing the vcc-supply = <&reg_3v3a_10g>; property
> to link the SFP to its power source.
>
> Since it lacks consumers, won't the regulator core automatically disable this
> unused regulator at the end of boot and unconditionally turn off power to the
> 10G interface?

Is it true?

Frank
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714143154.787825-1-alexander.stein@ew.tq-group.com?part=1
