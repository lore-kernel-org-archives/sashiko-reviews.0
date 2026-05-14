Received: from de-smtp-delivery-119.mimecast.com (de-smtp-delivery-119.mimecast.com [194.104.109.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55553B1034
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.104.109.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756026; cv=none; b=bQlf/NTfrdz/yJKzqEXXwuAzQ6iRnM4XVDVlOZjaqiONgo6NIP7DJhAOFyVQTPEFNPiZ8uHDX3D8OCtJjFlY8i3vAUQ5qsJA9MCuxSxNCNWQCXkL4uuCJguKlP8YkQ//OZh1VNSUljzU4ONCE4lNHegXR2gj3y7YuxCvwCl6BLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756026; c=relaxed/simple;
	bh=jxkYCwFS/j94NgmXD6wkRuEtJfn4ZkR0Qfwx6Gzq3zg=;
	h=Date:From:To:CC:Subject:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type:Content-Disposition; b=kQVqJ1M4+QNdGqq6S5rea11Cdi5vRrsQ5zthUwqxRZTskBStZRTPBJd+fUXtPnaK+1BTLdF3Zh2zM1EbHp1JvasBFlm5kV3lOsOMxO9fXilFa03RkZmSKL41Ofh35WfckuWBTLfI51H4wHCnjhu1qmZasaNj/onSNjYND+ubDgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=data-modul.com; spf=pass smtp.mailfrom=data-modul.com; arc=none smtp.client-ip=194.104.109.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=data-modul.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=data-modul.com
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020073.outbound.protection.outlook.com
 [52.101.69.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-45-U_XzCkZlPM2Oo8_NMflZDQ-1; Thu, 14 May 2026 12:53:35 +0200
X-MC-Unique: U_XzCkZlPM2Oo8_NMflZDQ-1
X-Mimecast-MFC-AGG-ID: U_XzCkZlPM2Oo8_NMflZDQ_1778756014
Received: from PAXPR01MB8486.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:227::10) by DU4PR01MB12195.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:620::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 10:53:33 +0000
Received: from PAXPR01MB8486.eurprd01.prod.exchangelabs.com
 ([fe80::5adb:b6ca:f689:1ac6]) by PAXPR01MB8486.eurprd01.prod.exchangelabs.com
 ([fe80::5adb:b6ca:f689:1ac6%3]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 10:53:33 +0000
Date: Thu, 14 May 2026 12:53:30 +0200
From: =?utf-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <bstruempfel@data-modul.com>
To: sashiko-reviews@lists.linux.dev
CC: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display/bridge: lt9211: Add
 drive-strength-microamp property
Message-ID: <agWizk0NTYLsds3z@DATAMODULBOERGELINUX>
References: <20260513133127.376458-2-bstruempfel@data-modul.com>
 <20260514052603.BE46FC2BCC6@smtp.kernel.org>
In-Reply-To: <20260514052603.BE46FC2BCC6@smtp.kernel.org>
X-ClientProxiedBy: FR4P281CA0405.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::11) To PAXPR01MB8486.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:227::10)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8486:EE_|DU4PR01MB12195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f960f2a-1aa8-4392-e551-08deb1a70a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|4143699003|18002099003|22082099003|56012099003|3023799003
X-Microsoft-Antispam-Message-Info: VU5n3AIh8GHgVqqrW8HwIcV9qJ8XKmCnQblfO1ng6FMAMUKQrfLriURvjqwcl1R5we0bVHe9MokX6b1YJPl5SVc0WdS/VRQ12l9xstS2RXtJ1pYO4SgpPsN+OC3E3qQuokuk10lNlPKUF65xFOeUpb5BG33CmmOeBCXT9GVlMUmQiitUMPx+vRpaCT1MQB2mOF51VdVvWXWnbo3eoH/R5/dqoo0miqC2ac9GBeSJCQ9fS/hzrer+pCFbkaa+i0qS/fxmspBLQKU6QAXaMgvtSiXjFHt7feR+v1Rwy/qqhztmkaIag8GeO+tEpft8hUGcdQaadn9R+cbDZsRzT/EA4j+uHqnk9n9YmsoncsmD5feiPAgNU5Aho6a3PyvGl8TKxeK1oLu1dQL8Juf0Zj3YMNbX5iyeaimsltk5CHMHgI8WV22DPwTEk8aI5sAFoKefHOf82Op1C4ERlDay1GalKlOEpsR0XtDEhjVUFDU347BsXN0phVOCp21Uo9hbHp7RoNqWtAUiJnc06Te8l8hN6R1T8YALN5AxJYDlNvc18CYzGkLBSir4mU31Wtk3pnuiabb0nriEbMJCHS/tIZep9BmWqynK7hRAqs7H3+h1ZKzmN1Q6i9f1zmrgtKub/BXsw3fxl0R8+xwMcV+WMIRi2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8486.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NKCbCvN/jRBUN6ZL0QoQFwN7QOub14xUXvxO2oVn7SiUk/grb3FvwW3jeoqb?=
 =?us-ascii?Q?aL1YAtWz+gM6dcDZWtuprXgrJO9Lyn9d1ZvEyb32SSXO7C6aK8d+mpqBnQvk?=
 =?us-ascii?Q?ZtvqSETusEUEudYp4UuQesKjYNLP+dA9EUVWiznE9cKHXnDERl/NLRcglK8J?=
 =?us-ascii?Q?k7W0tpM+mGgJ21u2dvvWzfQSTyQHOF0+4mlGKQumv6Qnx/stMvKNdgZpQ/Mx?=
 =?us-ascii?Q?VzJig1ksRejJb1TVR7i27dBOM9PvP7NTdDf+SHTSrx2180+bVA2GOtunxsj6?=
 =?us-ascii?Q?30EBbXs8OpUfX5XuAdYsi5evLi1Eq1AV53tVODIXZlan+3vFg7mwLxPpnppg?=
 =?us-ascii?Q?P84Pm1JHRHmdbedNprhJeij50KIL4dwOFz2vJiy2JAgyDGZSUoAHbfMA3bUl?=
 =?us-ascii?Q?r6GlT4g7gZEtHCTX5Fd5dArStl/AXxSTGX4Pt7+rEWDVh4XM6u7Y2sACxe9J?=
 =?us-ascii?Q?WHiFRSLd7KpHoZGd552kFEP4hvsF1BCK5pG6OSbx/vyaxA6myT1WKfxrX497?=
 =?us-ascii?Q?Mp0pZavQR2T18ucjo5iF58Tms9hiRR9TFTLcoFqA/9FcKm0tICgbZS0DMXs6?=
 =?us-ascii?Q?ag2/eEin7e2DHwpj+WZvkO4dP2kp+HE1GHmGpakCLPZU4rBLdWoP9Vplp+Md?=
 =?us-ascii?Q?i1M5KuwoOg4f1x03OndIfipkesh8IrIkAPVWhikHW+9TzJDFGI0SuEQO8WdM?=
 =?us-ascii?Q?4qvGikyvtGPzTzIG+cd/IXfaUH4o35ieqPMXkkoT54clkqpvzjyhrpSfwuA8?=
 =?us-ascii?Q?aDLrlq5/RojnmX7elOpKBESbowK3ebre9c70MBYgpLpqdW1ONVR1fF8oQtDU?=
 =?us-ascii?Q?Q+P22x9FW0nSKXn/3tr/usrNZ+z3xmne6+FRr4/ES57u4yJRImXUSubghfnK?=
 =?us-ascii?Q?lBXAHaqmzQzLUdmKRjUnUS4x6GF/s0hfSZov547spUbhrgbIGw4xlfWPmzVB?=
 =?us-ascii?Q?ChrPpfx5uyYfp/gkLGVrdhnqHrlnmM6CFuzb+Q7WsY4ueCsdJIyUshhEIpl3?=
 =?us-ascii?Q?vPFhqdUd8Bs57UamWSimKe/neDPS6MyEbFztEFhAp0Vl+VmzPoHoPEKjy0Q3?=
 =?us-ascii?Q?HdCEwqPErEqMLDvpEskuCZMuPfMn9i0eRot9zVhUMkV3wd5caCp3XI2y4ow5?=
 =?us-ascii?Q?e/aI/BnYyt4Yh05+t2c6w1rWmmloIZzkgiCPlPiNgKW+aXUacT5sTikYguKY?=
 =?us-ascii?Q?39g/RoWLtU9uvc/qf/AW8HPvMqokYB+h3MUbClrge9oCPiuqWeBv0eWl8MDo?=
 =?us-ascii?Q?nmvi5t8BXPak7YiiWtBdlFQvu43gSaMl/hVbZM4o65VJ/TYwKezjmkOLoK0O?=
 =?us-ascii?Q?iUn3FJTlU+I+ILiNSxDQ1P5sBILtCd/Z1kWTsAOkA8TnyyZven+FNFDlWtLm?=
 =?us-ascii?Q?SFIXma8C3YK75WjCUV+W3CNdwsFTDx0RjN7bdmET40m430qrW2IG85lszjTD?=
 =?us-ascii?Q?4B5a6GY/7NSXeyMX45tyCd2RkWcSixQ54QyEWdyDMBYznGpFDwHOpZk6ChMQ?=
 =?us-ascii?Q?/Ieja7omOqjGsucGrchkPkq78S+xlYnFtkA4U5r6TkGrDO2N5gh0/+PJb5hG?=
 =?us-ascii?Q?NPGlh5WedIKjyUSFDelkTpXcE5ZtWee2aGbJXskIJV/LXobWAOZh26cOWIAc?=
 =?us-ascii?Q?8FvcSFDppgjwjtPeqy5Fh7CH3k7obfeFDnNPFwo8SeMW+HCd8vPNM2NwjIJA?=
 =?us-ascii?Q?usuX8caOVtB8+QNjmCFOZfO4xsUhZbJMyNti9tPtf2Qs14IpbT64ZqwS89UZ?=
 =?us-ascii?Q?DWMdShU/qi+tHeDREFmqFR2HXMmm7YUyshiH7rsaZbOdPrUTBK/fOxiEQ5gw?=
X-MS-Exchange-AntiSpam-MessageData-1: 23qSx6l7zbldz+z9ipj7qkWTz8j/2s0Zb7s=
X-Exchange-RoutingPolicyChecked: mlXtu0vj07xnCKRJ8S/OcaxJtgFecy2lVhpz3aa8dBzFdN5ql2EqrOD7LWT7Hvv7Hzh+MudvXVUwcKVOfKk5zXxwgK8mOe6Kdm7DkHAjlJRJhEeqgWFlNYmpXLumWK8NofZkHlIDLwYF633yr7QjcCxuZFulVHhwf/ShCwMag2jB0/Qb72sGvbiqp2L4MMF5GB1FjJV9T5HeUhMQHjMubNz4GWgXeEyJNbbRroZ9ye2NED/EI5S14rI8DOmfRwnZ0/r6Yd9N1QYYTLny+2nYVNlVSLOCcdxY26bHSVsiKmpUTBdz5hx0rP10dPc5UDcCyLejU3JMvaCKI+m2T9b+uA==
X-OriginatorOrg: data-modul.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f960f2a-1aa8-4392-e551-08deb1a70a84
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8486.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 10:53:32.9451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d72fb47f-f4be-4915-91c7-ebd53299157b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJNWZ49jubJeHgSAmrGDSyly6J+Hcwc93x3TTwe49/F+7c4VtHx3eN1sAq8N2un1Eg/wzC0HiM5e1OdTXKokwwdjPvCHjNe/LAqmyh976Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR01MB12195
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ats8mH6v9g9fGrE5Nkq_cG2441V47rzW6jffzCvbhpM_1778756014
X-Mimecast-Originator: data-modul.com
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 05:26:03AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The values for `drive-strength-microamp` are scaled incorrectly =
by a factor of 100, violating the standard device tree unit suffix.
> --
>=20

Thank you for your review

> commit ab265d46e886455894986f313701d72a9407a58e
> Author: Boerge Struempfel <bstruempfel@data-modul.com>
>=20
> dt-bindings: display/bridge: lt9211: Add drive-strength-microamp property
>=20
> This commit adds the drive-strength-microamp property to configure the
> LT9211 LVDS TX output driver current. It specifies sixteen discrete level=
s
> ranging from 12 to 36.
>=20
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,l=
t9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt921=
1.yaml
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.y=
aml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.y=
aml
> [ ... ]
> > +  drive-strength-microamp:
> > +    description:
> > +      LVDS TX output driver current. Sixteen discrete levels are suppo=
rted,
> > +      corresponding to the following nominal values in microamps.
> > +    enum: [12, 14, 16, 17, 19, 20, 22, 23, 25, 27, 28, 30, 31, 33, 34,=
 36]
>=20
> Are these values scaled incorrectly for a property ending in -microamp?
>=20
> Properties with the -microamp suffix typically require values in true
> microamperes. A standard LVDS driver requires differential currents in th=
e
> milliamp range, typically 1.25 mA to 3.59 mA, to generate a standard 350 =
mV
> swing over a 100-ohm termination.
>=20
> Values from 12 to 36 microamps appear to be physically insufficient for L=
VDS
> signaling.
>=20
> If the actual intended currents are 1.25 mA to 3.59 mA, shouldn't the enu=
m
> values be 1250, 1406, 1562, up to 3594 to accurately reflect true
> microamperes?
>=20

I double-checked the partial datasheet I was provided by Lontium. It
states for RG_MLTX_HSDRV_ISEL: "Port A/B mipi/lvds tx hstx current
select, 4'b0000 =3D 12.5 =C2=B5A, 4'b1111 =3D 35.9735 =C2=B5A, step =3D 1.5=
625 =C2=B5A".
Those are the values I took as a reference for this commit. However, I
did not measure them myself and this might be a mistake in the datasheet
or there might be some amplification happening after, which is not
described in the part of the datasheet I got.

Maybe someone else has more insight into this?

In the meantime, I will try to follow up with our hardware team and try
to contact Lontium to clarify where this discrepancy between the
datasheet values and the expected LVDS output current range comes from.

> --=20
> Sashiko AI review   https://sashiko.dev/#/patchset/20260513133127.376458-=
1-bstruempfel@data-modul.com?part=3D1

--=20
Best regards,
B=C3=B6rge Str=C3=BCmpfel

DATA MODUL AG
Landsberger Str. 322
80687 M=C3=BCnchen

