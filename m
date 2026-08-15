Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130F2D594F;
	Sat, 15 Aug 2026 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786786741; cv=fail; b=U+iqYYQ8Yz88Hh1twUhJFm5uzk7mfOudaAg35bUjG8QTswruohKr2j3EFWKwtbPsrrOs2yjwHL77SgzUThWCcaA1j8Xv+WXkNYy8yc9q+z3ydN7BYNNXXr5BB7aiYNSFobsfGhCJsRecftx3HUO3XAOobhmmtKlGiKjDnxAOt0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786786741; c=relaxed/simple;
	bh=XBL9KwymMy1Tae86iEWCWNtRQLM266RZlMjP0XI5k/w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EB51M7ndx6GOZfAe4FoPip7puyD2FuD1EgPFH/vx5UKbm8cu9oHblh7Zf9rI+yZoI84heqQeRQJVqsxo1Dr6u0lhpBVzOXAsmzxvZPRJOCy3dwI0LF7Ilak9v6FVzvPTMviQjh8kEiD/8/T2HGzBhMEwgH8o0pHJX4HXVukIMgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ehVC1WcB; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ehVC1WcB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LytjpLsG5avhLOzFzqf8NrRwVg7cCxepnaCy/gd5v1LakKqasyp3aQ9Aa0CEhpWf39jzk78DJHIFEcR5ALvb8G3ru1KQws10ctpLbYusR7uSIlzdTqSehDLg9poP+VTlfZj2a4YXP+11w/TauKlwH2wBk2OVxFxszGm8/3rraRztNTXnlj7OOwoDdAKPQBJF30JR7aGJZgqopGaORjUJlyrObwtKPgo3ShSdJ72/9Tsk9Q7r2q5nX1E8/UnFj2HwhuZOMuHsRtiPs/Ma9hEq1rWhyGYXTmkNs26adgOtppk532PwD8Yq3yTcQ7nhU8rbNt0+q0tD3obpxxy/2WJtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNidvd1WpW8z8fZBInZOciIT/JlrqE0FRRovVzZ7vGk=;
 b=Wfv85AlkKhSf9kLt0MwMwgRBUSX4QhjsNbyvstkiaSqB+3FXq6Led9Aj8jS3MPTIfOmBfXRBOSZBji4V9ZBnRof+bw+Tg2lW7itbEIi9H0+hAs/UwnlIVM+vDHlGMoADg+lOlsCYQPxQPIHaZ8dmNgiDeSV81b7zI8iYK4FChDVcc7JSiTPgIbIOKUFD2ysCU/4xjY2bO3spuiNrmytiCR806/hC0IOK7aOW/88GcCuUi/O3/FJ1Ufxbs7TCd0KH/WpB6is/ySw7/Q0T/jXD7YEZ+6lzXU01pvmyKxJvc2I/dTt3UgxSRhT7/cMelBsHw5XWb0F3Gm1gyYB58Oe7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNidvd1WpW8z8fZBInZOciIT/JlrqE0FRRovVzZ7vGk=;
 b=ehVC1WcB2x9kgKe1YnJ5cUxRCZ7LbEAlEhUvwmXtbW8a602QFb0TelRnYAYfaNMFwt5Qv2P3woX9MY+9Jhu3g9BKADk2Lpsj9M28SdmPmfFeNvBqC2U86aM7v5AEpOsTQBnbdB1DrfvMy7B32FoUCiPdiLHfPXExTgg5iDXeDmM1Wrzh1yqJtQOMs8AabEVA1FUmKVFokFqRzz3s3t/f+TuThCYQHj0eCC9gdLoNHXBj7/7VcSoLYNXhlULmeJ19f0AX7ReQLn2Xr241jkq75ZNHt65fGBOMto5oy6D9lOZKJe/NBUiz0SJAWTT5jE0ggSjQ1fLojTIg+OALRxVlNw==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU2PR04MB9082.eurprd04.prod.outlook.com (2603:10a6:10:2f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Sat, 15 Aug
 2026 09:38:52 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0315.014; Sat, 15 Aug 2026
 09:38:45 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux and mark
 conflicting devices for MQS1
Thread-Topic: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux and mark
 conflicting devices for MQS1
Thread-Index: AQHdK71vIer/rbzmokGM2+Gcwvp8JradJmaAgACT4wCAASFd4A==
Date: Sat, 15 Aug 2026 09:38:44 +0000
Message-ID:
 <AM9PR04MB8353A5B45A310B253892A45BE3D92@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-4-chancel.liu@oss.nxp.com>
 <20260814073138.27F5B1F00A3A@smtp.kernel.org> <an9AaDX1EnCDVMRw@SMW015318>
In-Reply-To: <an9AaDX1EnCDVMRw@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-08-15T09:36:38.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|DU2PR04MB9082:EE_
x-ms-office365-filtering-correlation-id: 71b64a80-9797-429e-e206-08defab0ffee
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 5FTCAPTnyyJyxBjmm2sQwZFqlQOuw7/R8c0Paf/ioiwYXs89gqCKcV/icoYo7brl/HjvcgZgDMpjI4kpldAJDD5p73MjBgoKhzlig71WXEVZWf2ygUAycWMtUpXhGfNU4ftSx+qEe0c34VwNeFs86H7QXUzA6e+KfPZ5h6LmUjPx4UAVTsR4NHfXqZtD1MqOy3BUEJA07s1vXvezETSK6kwsPwO/RHwu9FaeB/3fFa0uqQO+/6Xy5We4EnMD3SCLL9GRhbw0CC8fl+KXa4AgtL4XethgiQ61SeKxLDwRLHbQDcTiDmWUfgDP9vSRVlu/Qlw0h1hSp+mvQn6urTogl6AqbIJKq1w/ic7JHRTeVbNs1hwKTn+HNjMO3CvRUKWjijqGiLLd60zsOdo+w+KjD+OI2CEQe4kwRa6sMlOmE1re5f8sxgoGcrEbJe67jmHsf1/xWVaKoCpqKtQ2g7MC666fYlZUQ1nEnj6POf2N+cZD6B+m/8Po03SMYXorYE5mmVawIYU2tIyN5G23MCz4/mLQLyrgpJOcj/zIW4jYhzqz8+ueEdIKrlvmF/T9qM22FIsVSIO6z7owMuXUl1REVuvqRMBIc0mNlHHoQ8lOWrBCvyU3YyvRDoovIdUShRUtVgvO9Hf3m0reYAxF1y/wLTwM39erYTYPc2t2yBsAmFE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1FL4oLIPR1NSIw3B0hgoVhK7BKM4Bmeik84YJj7+qlENmu3cZC60z2GqX6xR?=
 =?us-ascii?Q?+tkCphwCDzQfxmzdc61zVni0uOc0CT5cw0zmTJwer3nrNxLQOgsuGHXay1EQ?=
 =?us-ascii?Q?yWGh8Typl83nqUhYvFQTi1ql5JdZ5Ubk04XSi+BzpIjI8XYntWFZIuQqAKV3?=
 =?us-ascii?Q?Pfohnh/7yjSNrwpImkgj6kuv8IkzZU4s2BUKwjobf3ycXyBFDUsnqTL3/zYs?=
 =?us-ascii?Q?S/Dfd8JTDGBteZ+fgUIvRTghi2N11aL/XRQoIE8XJ7aCyhpmQL9TuWqpQYet?=
 =?us-ascii?Q?nA/MrZiq0ixCp4C5xto6KghRYEhvk6JScPEt7Jw6RXngxf1A5fwMx+FJdq8J?=
 =?us-ascii?Q?5EMfUBIKqqwbRn8u8EOUaP7bg59eR21+hDoL8dk/Fod7VkYMkYVEOHj9WOCv?=
 =?us-ascii?Q?tS++mcc95Rg4BFq+minyM5/p3pQ206tODXeduvUbRF7P8tAO9mYzOOfJEduE?=
 =?us-ascii?Q?EJ3GVCZuTpZIw2MR+9V8WsEPNMqeGDonSgBvCqEy4WrJJJrQh7wYfAXQlpor?=
 =?us-ascii?Q?BAOwAX+tEdAySyJahAOzWa10QaG42PN6f+kFBHpKw2wpXQJ1QHuLTI5DdLCx?=
 =?us-ascii?Q?zIcEvoYEt83WQhXoT07u9gCX+ojd4lwsj0XdKI35nhdtIVFMLF/5jsOGObkc?=
 =?us-ascii?Q?NwZsbHUYqrVaYqzslB14KVhdGSdQBjdI6+VUAD8h2Di1578YHKdgFWaPkImt?=
 =?us-ascii?Q?gmpo/lS+cR7cQXo8Mf7rlAprUrS8ZrqJuPHhLeADjMPwmb9L0ZqqDKQBgyaw?=
 =?us-ascii?Q?0YUQCUIVzy4FMz85LmvRC8eJfrZMy00ScOvaSgQtXqeGQlXvL0xrJRbDJ43c?=
 =?us-ascii?Q?8p3NNX7VdiSn12Vi3xbt1/ydlhFzDP0OKqWxta/hL41X0R+oeUxIZQHSd7w1?=
 =?us-ascii?Q?3iaiqDOLiXw91bpc77XeAGjxjcqULChscYTlocU8bEkjkjjwWmRAQwlfu2FX?=
 =?us-ascii?Q?aSvzF/XmTS3dcFDis0XeXq24u+dxw7SOQGUr8SGEXJ6areAIrvQdooCujq/l?=
 =?us-ascii?Q?LG3yThYzVKrH2+uvY702iuSOaL95J/LxO6mwn+z71oT+oPth+3RvIbX2lq91?=
 =?us-ascii?Q?uAgp+XXOSG5kRY48owpE9ECPC1TwH1G7J8eUGY6323CPwPd5sEOjEoTdCNUa?=
 =?us-ascii?Q?9zx7hMa9kXep+ZfqmckC0PynDrMZ0XkBu2yTWwgyWCtdZ89QlZlq9JkRXN9O?=
 =?us-ascii?Q?+Z+NPwMFt0jqrekvwqyCP0j4/W/VEIcN/aC+Lu0aTHo+8sdf45UyEsp03jl7?=
 =?us-ascii?Q?t/Y4YWM8A2rNCc6KwlEeErE6AvLnWx6ICimF/FXZh5u7cjhELAr9i0TbS/Lt?=
 =?us-ascii?Q?PoWduDnz2Q+/HVZe9GGEvDV5zO1B27O5XgBRu5Kr7tY7QwSDwUeJg+/VKDFD?=
 =?us-ascii?Q?u0zQYsPG4u6jKa+Lcy7yMjApsSu4/KhbZEPEItX7MATAHvkRADc2mRdsRwhY?=
 =?us-ascii?Q?Q9zCuz2PKhUTCtu2vWAsDdPwoPvqKV8ozXBM9hqx1ahzg7uGFp3BWYB2bw61?=
 =?us-ascii?Q?yXIKkpw1rYwuCnhMHf77n1yE6nEHHP57Nb9Bi+kFb5Nt0JgV87LoHJJmCREL?=
 =?us-ascii?Q?rlqg9jVaNw1ZXDj853MEsmxKdWAH/MwQaYhy2oxo7rn7rqU63KunE4JAmntb?=
 =?us-ascii?Q?oZv3yews/bt0D82k3ZjiCRBeJ2Ion59iAAtZqTRDkDkiY86a9G/4j2e4dIVa?=
 =?us-ascii?Q?7M6etBaNPfA2CaE++wzywMeRJiBWlE+NUd3MZ3StGxmwFdgdSdCz9jXQ7MsN?=
 =?us-ascii?Q?czLyreCcrA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b64a80-9797-429e-e206-08defab0ffee
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2026 09:38:44.7621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x0G02ndykwBEF7BE29cd1j+D7A5lsHUrI6coSUNpDAvwhTfTJDO1jcninZ2RujZGv5EKm5ZpILjT6zRl0oSD6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9082

> > Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> > - [Medium] Undocumented modification of the '&sai1' node's clock
> properties.
> > --
> >
> > --- Patch [3]: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux
> > and mark conflicting devices for MQS1 --- commit
> > 2ae9b14f843efe8a48368cba7c61c4f11632f83b
> > Author: Chancel Liu <chancel.liu@nxp.com>
> > arm64: dts: imx91-11x11-evk: Add pinmux and mark conflicting devices
> > for MQS1
> >
> > This patch adds the MQS1 pinctrl group and labels the conflicting
> > sound card and micfil devices for the imx91-11x11-evk device tree.
> > This allows the shared imx9-mqs overlay to disable these conflicting
> devices.
> >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > > b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > > index 4d1ada6a3942b..4a3dfafae3773 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> >
> > [ ... ]
> >
> > > @@ -511,10 +511,19 @@ &micfil {
> > >   status =3D "okay";
> > >  };
> > >
> > > +&mqs1 {
> > > + pinctrl-names =3D "default";
> > > + pinctrl-0 =3D <&pinctrl_mqs1>, <&mqs1_fun>; };
> > > +
> > >  &sai1 {
> > >   pinctrl-names =3D "default", "sleep";
> > >   pinctrl-0 =3D <&pinctrl_sai1>;
> > >   pinctrl-1 =3D <&pinctrl_sai1_sleep>;
> > > + clocks =3D <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> > > +          <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> > > +          <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> > > + clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
> >
> > [Severity: Medium]
> > The commit message mentions adding the MQS1 pinctrl group and labeling
> > conflicting devices, but doesn't mention modifying the &sai1 node's
> > clock properties. Is this change to the clocks and clock-names
> > intentional for this patch, or was it included by mistake?
> >
> > If it is intended, could the commit message be updated to explain why
> > the pll8k clock is being added to the active SAI1 node here?
>
> Make sense, please update commit message
>
> Frank

To provide the MQS MCLK source, SAI1 clock assignments are needed.
I will add commit message to describe it.

Regards,
Chancel Liu

> >
> > >   assigned-clocks =3D <&clk IMX93_CLK_SAI1>;
> > >   assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > >   assigned-clock-rates =3D <12288000>;
> >
> > --
> > Sashiko AI review *
> > https://sashiko.dev/#/patchset/20260814072022.4064009-1-chancel.liu@os
> > s.nxp.com?part=3D3

NXP Public
