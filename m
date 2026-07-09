Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF313E4C7D
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582372; cv=fail; b=n9xWJuoEje6c1ls4/jt32ZuZaGb8AHArxUv2pAJr3OCIkhmNvlJYxtb3zjyxa9CKJYbd7vTLA2gMMq1vp3+67/KxeKe0W3SK7uPpuCYN780wOtlx5xZ/OQNLgRwRNtgQ+EGSJ76LP8gf8+oi+IqDcE+6fkGM0CBhMbYa/skY0YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582372; c=relaxed/simple;
	bh=wNwZikjWCytc/IwvL7N9AVusv9fFWWoD/JdCjHJf1OM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QNxc9bxRJl9Ek4e+Gz80G+QtvQpvySmqmK+NaYo6lw9+OvOeuI0DubhCqTuLJMU4fl16UseUY2/wxtJ5EIb/ELkloHhx30v/z1k5sG51EzDeO4Xl+B5z/DFb3xnW2v1d+zROmdpz4Xlu1+b0s6yliDFWP8qnxi1LWA0I9O6Zixs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=bqLwM6/a; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="bqLwM6/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gI3qyYn2r8//edlXMG5zby9nXlFNBrvUg9wRkjeTsrgDUEfdcdg+LPdiccF4g9MB+9T4rB2siA37IgO4zwO9Gme9n5W+X/X73qJGneKWxFG7WJWqvXwVYVOhRvoQrSLTw4AgBbqmIecRuofcLS1te15lST1lBzMNUD7FiosfI4INuhdMjw/dT0ipy/R1Ddzj1T8iE29/nMJq3bN5ZHg01xUfR+Fo6+LZDEuidtnM9PpMvj6qUp4YV5QJGZahvZR+iIIfCovrr/12h7DulZOjgtf7I34nCVNCCJojx/51uJDANNEPsQESXSbcKz3WoIY7K3gDD5iEes1YmypSrjhwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7/wkLEw/Ce/4wy5UvRuW8FPMPN06QFeOzWwZExtUCU=;
 b=FBHxurRF4zTw1Sy3RIuIew3hDNewg7MizKnbY05E3wTiBuFgiEkhA+YPlO2lpSaHwM7+Go+0v6nK1ee2tBYjlQ18D7DfFFywuRtBRFoBVoClkX/H1MQOiPBS8AR5U36MDwTTf4a6HFsfga8K50elYPXPINmz8rTeA/YgAkkZDclBUPcRqlUMeTrMMY8rIImft088xZg2NEdSEblR8uE+j+2ujsxjqFuggN4m9A/HEm7ZNBxHmJq914XeVG2Qpqm3zkuVf/kbPLXrlTSKjgh+9WjTu6b3guURRsv1ydiCulUZ3eh5Ogh3TfOo/cPHKYAzq7uQb3iuGzb8WwLGQvsqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7/wkLEw/Ce/4wy5UvRuW8FPMPN06QFeOzWwZExtUCU=;
 b=bqLwM6/a/YcZ65gKsy6dQRlZ+DFw5g/sM5smj95vb6qmzJvVQsjYzivJ5ZOk63kuZlyyZXUT2DFi5XrA2t0i5A6dK6EoNBJQSZyK54X5yb6DB7Mm1BwflCfEpzpY24SdKIdT5Kl0iFnwUUSywoeVU4eoe9b2SzSptSloKaFVQIc=
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com (2603:10b6:a03:53e::6)
 by MN2PR04MB6464.namprd04.prod.outlook.com (2603:10b6:208:1aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Thu, 9 Jul
 2026 07:32:46 +0000
Received: from SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0]) by SJ2PR04MB8896.namprd04.prod.outlook.com
 ([fe80::8292:662a:4214:95e0%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 07:32:46 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v2 2/8] riscv: dts: eswin: add clock generator for EIC7700
 SoC
Thread-Topic: [PATCH v2 2/8] riscv: dts: eswin: add clock generator for
 EIC7700 SoC
Thread-Index: AQHdD3UiyOLaN5AyQ0GVeNSlAkzblg==
Date: Thu, 9 Jul 2026 07:32:46 +0000
Message-ID:
 <SJ2PR04MB88963D8B389F871A8925109883FE2@SJ2PR04MB8896.namprd04.prod.outlook.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-3-pinkesh.vaghela@einfochips.com>
 <20260706081623.5AAFB1F000E9@smtp.kernel.org>
In-Reply-To: <20260706081623.5AAFB1F000E9@smtp.kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=4e9b6825-d573-4630-8899-25c10158484a;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-07-09T07:30:12Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR04MB8896:EE_|MN2PR04MB6464:EE_
x-ms-office365-filtering-correlation-id: cae37772-b0f7-4870-9317-08dedd8c4563
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|55112099003|22082099003|4133799003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 mxTs/RXMide7rZ2iaiZftxwyrbZle+gBW/faZQROdSqU3Egrfie/AWsw3khQdK9hdvvV5th0sYdnn2oYSV7+2eGLl2KrghhQu6YF3uVKxpckOkeliwHp4mrqGF5fYeSvMOfRbWkvozxXVdNuFtM42Ay6rhd+UM5k9qmUPwDK+5F0Ubl3mdRbnX72F0oR732codClQLRxgvOArpwddQWiN7k5LDOc6OhyEiNc9LtXbFJwuPRwU7EjdNpPSvb+8xwCwIU4NYtIjrWgb2tffaleIrII+naQNIi83q0r/qF1YKD4StE0dITOVyyVH66prkpon9SuPBkTUP1PqE6BfFcVXbsRiibIRnoZv/azVS43/LCuMBGBhohb2S/+T7NuHTXXfB5JrTPbfrXzdlW+LPSNel54c5+fKv139NZcTVqgxKlXkMjYrhDOzz6J6KO2hY36co+hh8KTOP/m4Fol8ZnXy99kYU8HjOnta6SMh6pJGHsF22Mp/ZXKK11WtBnBY99plFqy4SWh/5ws+/tnCcT40ISkn5ow6mXguJ8fMjzu/+5ymS8n7Wnbv5J4So2svqOFxe/u5PfuRhmkYnu4zUM6I8BulsmsImgDby6gcubePms/Fz9WwYWGzi85m2sFG7LdLCqdAchi1NL/IqmzrXrhcEqAR4Ic30rXVNRILXA9nCWsgBU9sEv7dHbzs0fZOINgZwocGWK7faSDGRnskgf9FySXzj7J0sSZAnwroMAEJOQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR04MB8896.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(55112099003)(22082099003)(4133799003)(38070700021)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xAIgRVnmKOIagOf5kJqcXd2N01Vr7tItpx1963IN1M3Eb8Nsbvv8c17211l7?=
 =?us-ascii?Q?28jbLSWkSAMI/sEMtPNl+kMuCLGsFNFXSsy1R5Q20FKhysQeUw0Ixu+PRI1r?=
 =?us-ascii?Q?DPiwpz/F/fmBXkbidEMte/bbyqowk3wWQbyq5bGzlmB67Ng4a//6BvKq2N2I?=
 =?us-ascii?Q?uUx+p8c0lcqzis2W03Xj5h7lqeHsvdyilYoqUtVny+EKK8M0+GaNHzXs6VC7?=
 =?us-ascii?Q?ydYGAi7/Q7CR7/zLDYnGL6nHyUCVGrSpkII8rTJwpCQVoIIxNahCyOA/QWNw?=
 =?us-ascii?Q?NkArh33zKhMYxa52zD+w70zyNeEKl9m3f2zW00iGvWxfDIufjArUR/zQmPDW?=
 =?us-ascii?Q?kNeqn24n+LFBnmzHDnOjWplEUQ5RN6IQ5SaO8g7Xa9mjHL2sOtwc5BTEW2tp?=
 =?us-ascii?Q?2D+ZOjBh5kLjB1gBk7RJKnLKL4PI4zV4hZoECEC7dU+S5062v1M0cMcnDX7P?=
 =?us-ascii?Q?cuGpBFG+GaPIHXP1M41iOzr4e77KLYANcVq4wwdqfYY+33GjyBBRFAnOEluB?=
 =?us-ascii?Q?NoKTTJq64r1wNQNjiPWUxb/qTQQhycOPpU9yuZswfhDBuFlVsMR39klLjWOw?=
 =?us-ascii?Q?+7kV63iApJoM+oHp9J4h/SQpyDVWJCVARbwIZog/nB/XbNoMvydD28feZ7F6?=
 =?us-ascii?Q?Qw8i/jBY5Kew8Z8TIfc+r9lztVQD7s2rYx/HCBIqRtsIGpEtS8vzYB8YxXys?=
 =?us-ascii?Q?GII4Z/PqqguhhuEd9q1SXCi/kcpjluDEPJ/XrxzZ+D3lVQg9HwvHtgPp49nX?=
 =?us-ascii?Q?OBFhYuCCddGiSdL5UdYe0ejCtPAyc/M0cy5zxd679ZBmqhumndkstcFMCLwF?=
 =?us-ascii?Q?54G8mKNTWY9GPWwfpyIc6QrkPW5rpDnCg9oetcT64ri7sfOMnrlxVDR6rU4V?=
 =?us-ascii?Q?STlJtZr8gWuwnj5aHxV8ghDa3bwv84MP7WrF/jhdeq5pOwdeO3LTMn/WomhT?=
 =?us-ascii?Q?AkT9hgDa4C4jR2iajEglW4DWfXDrg9gXRN7tf3TxFbumRVHhtue9jm+d/aD3?=
 =?us-ascii?Q?rTdyGuBqe9r/QE0pDq2d3O086DRycsX+Ua0p+qmL3MnfpqYWIKGUm6LZCOKo?=
 =?us-ascii?Q?+3gOH0lTSJLFURhYRpQs6PP4swwxy4D8pcvahZYsVX9I+OofdOgdlRK4OPrB?=
 =?us-ascii?Q?ckETKshLHfZ1aIBLnBDpHdJwirx0i9nRTVNAf+4rz7J6JQg1USY8vymaLhzm?=
 =?us-ascii?Q?DtoVSS6tqjqC7JF8qOOPqJcHdCyXmG76H1kO94a2jhVKSvGRrZSp8/0LF5vF?=
 =?us-ascii?Q?PexAVWwvu+bsDM/NKJ0inLicT3dtEv4TDp1SXVp0TPFDhtvxAB0oFkpUxe6C?=
 =?us-ascii?Q?9XHY6G1bFwsDVLtVfiWaQm1Rms+YtzvwtjfmFSfIoIqNNODsHot8DEpvZ7ju?=
 =?us-ascii?Q?h1kg1ys5qM4yIQtyL/n1ebGe/nSUXZayqJJu94jo+uhOcHOz73b950sf8HNa?=
 =?us-ascii?Q?eGcGybC4JT0ZGfBeRjL4fTaDpM6FO953CCpEQF0TnBvzxjPUA/ASt5zhQQub?=
 =?us-ascii?Q?FAfKDgIGHFr4kzbr7gaeQ4aUoixM7nz6OvnnI42A/xZU5i/9P3YQAwvqpRVw?=
 =?us-ascii?Q?WKNtWmNG+5UmCKSJcQiHhj5XFRfY2afI3T1CFRcu8sOp/q89UtbuMuw9A6aL?=
 =?us-ascii?Q?XAc9G5U2BSCjbvYU9bJpKFOOB08h32eG1fjtbPiJOz5R5jNGOmvIm+k5zHyU?=
 =?us-ascii?Q?I277qobwSiTRH27pJlfQ3H9yEztOzSUtGnRC5bmRUHnRdQM/dr1Qjwb6etJC?=
 =?us-ascii?Q?uMeMmxJ+xQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR04MB8896.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae37772-b0f7-4870-9317-08dedd8c4563
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 07:32:46.2140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGUaSe97dS2OipT9lPbiIHHIwbhILU4ymL177yTVRYaIdVYV9aGRUwK8MtaFWb3vjT0rG7HSmRUqxbkyaDbGBOV8hNndRb1ySgVq4Og1YsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6464

Hi Sashiko,

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s)
> to consider:
> - [Low] The fixed-clock node in the SoC .dtsi is named 'clock-24m' but om=
its
> the 'clock-frequency' property, deferring it to the board-specific .dts.
> --
>=20
> commit 5bc9617a8cdce75f4ec3cb72e9a91cca1ea64a55
> Author: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> riscv: dts: eswin: add clock generator for EIC7700 SoC
>=20
> Add clock generator node for EIC7700 SoC. HiFive Premier P550 boards have
> 24MHz crystal oscillator to provide the input clock.
>=20
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index 430a210f01e66..af9e40d8739ad 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> [ ... ]
> > @@ -203,6 +204,11 @@ pmu {
> >                               <0x00000000 0x0000000f 0xfffffffc 0x00000=
0ff
> 0x00000078>;
> >       };
> >
> > +     clock_24m: clock-24m {
> > +             compatible =3D "fixed-clock";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
>=20
> [Severity: Low]
> Does this node naming and structure make sense if the frequency can vary
> per board?
>=20
> If the oscillator frequency can vary per board, shouldn't the node name i=
n the
> eic7700.dtsi file be generic like 'oscillator' rather than hardcoding 'cl=
ock-24m'?
>=20
> Conversely, if the frequency is strictly fixed at 24MHz for all EIC7700
> implementations, shouldn't clock-frequency =3D <24000000>; be defined
> directly here in the .dtsi to prevent boilerplate duplication across boar=
d files?

We will change the node name to 'oscillator' in next version.

Regards,
Pinkesh

>=20
> --
> Sashiko AI review *
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsashi=
k
> o.dev%2F%23%2Fpatchset%2F20260706081055.1126275-1-
> pinkesh.vaghela%40einfochips.com%3Fpart%3D2&data=3D05%7C02%7Cpinkesh
> .vaghela%40einfochips.com%7C661a2b84b21241ee99a308dedb36ded6%7C0
> beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C639189225884028092%7
> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C
> %7C&sdata=3DiSr6Z2nPiB6uohFxn7mNm5F%2F1O4im1MriBk%2B8CMIJoE%3D&
> reserved=3D0
