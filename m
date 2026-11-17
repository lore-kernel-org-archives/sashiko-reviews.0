Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937331;
	b=u3kzGs/hPa0VnZl/li/QbaJDI8z01gGXl1lRYt+5oST6fNmxT2URblGJLjX8o+hAvl5d
	 HWSnvtsoO85llCr/aW90M80UKUq3C/oFs09se/+DPX0AizdbvwJLE0AUB5ssOwAIqUHX1
	 AB1k+Anr/IPvFR6vtHQnhTGn6seRVDXGzerDH7sJfRzwjyA/oUu0sxpmdWeJyTf6VA0UR
	 nJgDn0wg8esjuvQLMi6OoxKrs2zf7GTJslejiAKZYhSZvs+aQDWV8v508izdil2LrPeVt
	 n9tJ133b/dLUVl9rsaKVsi+E5VCVgX3QtgHWPWhmgXz+i6UtnXR5DVg/RLVaw/JZ2sA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937331;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YbKRE2Vsv/ZeYBynhp+udM4bS166+T+gvDCEzrzXgiE=;
	b=PiRtADOUBnRGj0kAyBnmRtmhU5zq5tVslwNHs4cSqx4YdMtJaxsTHhjJ77NvDpGALNgG
	 eHBV5PbFBxtyPSE8+Yjv8hM4dvFrj0s+2sgLtVsWUSBuFxmtb1xRTO54iiiuSgs5unSoU
	 ZIM+PyfTDO+M2U1Zn8NKKvkl/zP5d7AUjGofxK1rKISKMgzL6p7LcjvX+1X8ub+y6ifCx
	 x+Qqd7a0w1mpjLqCSwUByhVE8nGH+pMRRbjSPCglp1oDeOj8Y+tkt8dL01JF95Gr6fefj
	 F2SmVVEza4rFJG/j4ZBq0303pR5i/3Hepq8RdkTrIAwoNuxvkYCl4nF/MfJMyBoHt7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WNLf4zZW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.15
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AF606A8A9;
	Tue, 17 Nov 2026 17:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8AF606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WNLf4zZW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+Ir/EQ+9ntlkGcEODI7pLEZkl7JRPxv0svKoFtqGJunoRzuvY9IfjOM5B15xpFKhlIpk4QMaGwmCctDuL6la2eXqRkj/wLmFipxSDRnyT9ht38HcUAnSSlpmNjwoK1DaUdfByfAEPpRXjejFLZkIRcElJGx/NANgX11L0xX2UqdEYxw7JNmCs7PdZqdR8MS06Wf1JnIPn8LnAnIges4xPMUJp2eWs4T/JrOv1mg7uL6y9aqVTQNuNWBvUhUOVbrtGWZ5Ngn9UAN54VYb1nCyN8bV77qkb9FCN/kUrDuCiFfs8NuLHkkLRK0Lsz6UoM314S/1MSbaTeO+VJAfVRaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbKRE2Vsv/ZeYBynhp+udM4bS166+T+gvDCEzrzXgiE=;
 b=VztXGGeJWjtes2fPpE7lUjY+aEaLhVYWlY62N30fQQhiiwtoi7/5v6izeenzcx1ar99J16eBtgTgWSyfMbdnLXeDD41928wAYRt8E4Pi8BzbTWtmSdsj5AZa3O8XdM2iFO2zIGjFvR5MI8pMFnCdUw50//ixXIzi4rykLFnsFikns4UHtqHrfMepsSyprxqil9E4mOxlzS4KBD5Drp5msvoniZLseueeSGdRtMnfDZYTTmgjkImrnEhr58FMuv+i/sGvF6nZ5W11m4fZQhIpbMKVT0ge4emVNAcYwRTdRFJAKdaGNrJUHRk2+o++Z9fDpqQ3VxZN4vuR0zUJPBUMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbKRE2Vsv/ZeYBynhp+udM4bS166+T+gvDCEzrzXgiE=;
 b=WNLf4zZWo8nr+4k1r29rxRY7DkRm8nlBQo/J09VJ5Duofum2QY2zKE8t0wdQr62Px6gi8vtfbsTPkMNQ+GmCZfB7zLZywpBLNz7YJllqB2zjoXzvupns9SGGRzRADuJvUKm2mGRv1FFwxJtyU0uG7+JWvKrk94sY5vy7Z052o9PiV2kcQqIxxrN1mAGvYvNtDWg0f8oYjKuV+Vm89h9/5kUk/pf7+E/lnmA1ADvsG4wvqik6dF5E83KsiFr6UfaMCy0axYeRT8jdTftbYP58Bh0VG5uN240kHQFCPT3NKeeY1R4ErXlUrHtJNE2RxhKvzhZrqdGW/wV6zYuQLD3k6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI7PR04MB844841.eurprd04.prod.outlook.com (2603:10a6:290:10b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:42:08 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 17:42:07 +0000
Date: Tue, 17 Nov 2026 12:41:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>
Cc: sashiko-reviews@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, neil.armstrong@linaro.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 2/2] i3c: master: svc: Add amlogic a9 support
Message-ID: <avyR51ilfZ5T6tq_@lizhi-Precision-Tower-5810>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-2-3d3222b7128d@amlogic.com>
 <sashiko-outbox-216859@kernel.org>
 <avsvRS6ADfbzQkpn@SMW015318>
 <f17ef3d6-fa99-4fc8-92bc-1f588f3bf179@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f17ef3d6-fa99-4fc8-92bc-1f588f3bf179@amlogic.com>
X-ClientProxiedBy: PH7P221CA0066.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI7PR04MB844841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1ac2ce-dab5-4d83-d9a7-08df44d219e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|7416014|261102123227099003|261022115727099003|261022075727099003|261022113327099003|261022105027099003|261028144727099003|261021121427099003|261021130227099003|261026135527099003|261021123027099003|261021133027099003|261026121527099003|261026130827099003|261026140227099003|11063799006|4143699003|56012099006|10067099003|261021135927099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	E365a58zrADcmfpsm2fHVh1oBnAnWRgCl9BoobNU9C8NhJIeQdPijBqsFrLbHEf3eLXtaYOLkR2FJjWBZZR8jkZqmY5j7i3qEx43OpXVvzNGFBgYu0Co5F0xcpKJfcmJnmrO6lKkOxlcdShD9/+iuyqw6h0MMdOivKe97f3S68rpaAtu4B+DZT+t1uavQ8CGFFM8dpVKFoKps0IRb4VAImyhAncJrOEoqTbXNXtRRvRndfL7lKttiKcYbqEF/4Hie+PXqdL5mou/B0XxQafiXNBKqxiLHJOjLsEfJZ2RVgnDZde4ugLlaBrtZrtAJtl1FYj/DahsIZZC/I+1yURU7q7QyBiOUfvK9dQQgYHizdNQ41CRhoVyPaoTrzYaWhnhu+EWYYfPaHLaT9pxmtHW3mQ91edssl+3V50T6ayzqzi02pEaHU05pxW9VVipUmhAGDg7tSsbQo9zgGxqwPxZcotrlGayhNV42ECAUzEhD2nHn3LXX7XB7OQxZtm/VLx3dH4rmLJM51wYn4nYHk6f2gAwmxnnG1OVRIT0sQim7lcBXL8bs5/FeG7wR+jfU0x/UtaXU3b04BtNu7HBJuezOhB7lH7GXpuh6KBTHF/YQkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(7416014)(261102123227099003)(261022115727099003)(261022075727099003)(261022113327099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021130227099003)(261026135527099003)(261021123027099003)(261021133027099003)(261026121527099003)(261026130827099003)(261026140227099003)(11063799006)(4143699003)(56012099006)(10067099003)(261021135927099003)(18002099003)(22082099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0RoM1JRandZQUQxRUVBL0hDWllTTkhBY0JhRk9oRTZwU0M5OTR2NDVHY29Z?=
 =?utf-8?B?ZkN3SjFydlJjNTYyV2grWTFHMnk0ckZZdlZMT2gyVEhGTXRteHZWaEljcnoy?=
 =?utf-8?B?cDZ5eWNualhUMk1oNFpPSHhqK2t4UmNrSVlFV3BHaXhVcndXYUQ0bFR4VlBV?=
 =?utf-8?B?eTZxU3ExOVI0K3pDUktKNlA5ekdIV2g5RG1PdGVybllFQ1hKcVpWNDJEMzNh?=
 =?utf-8?B?Rm1NRlY2c3dnNU9YdUw1UUJBQkJvTmZwaktTalM0K3Jwc3ZPbkp3OGJNQ3RL?=
 =?utf-8?B?RHViQ0RnUVpqL3h3bEQ2b2JUbW1vYTJKK2VHZ1hhT0FWUmdSdmppRWVCWEpi?=
 =?utf-8?B?VEh3cG1JdFk1R2ptQWI5bS85TzFQcGl3MFlyenFaWUx5aTlNTHoxb2lZK2c1?=
 =?utf-8?B?VkZwVnhwa0I0U1ZSNENsZXZUcGRGUkQ4WGhBbklURGNSN2V0ampsVm9Qdk1l?=
 =?utf-8?B?Uzl2VG91a0Iwek5aRm9STTlHN3g1bDU3bVA4RUdpT1kyOXNONDFqNFJ1RTRT?=
 =?utf-8?B?ZE91dFpoNDFPSXVlN2t5WXdsVGRVMmU2aXI3N2lyRmREbVlOc1o0ZjNNc3RH?=
 =?utf-8?B?NE5XNnpHajYyZ29IUHFsRnFSYnUvUHplU3RBTXRBZ2x2OUlmWG52bzJ5dmpv?=
 =?utf-8?B?UExiWW9ST3BHUU1GTndlQjdnajkwblpONUE1WVRxY3lXdUtRUitQbE85QUJl?=
 =?utf-8?B?cmN1NXE3YnIxV2R3d0syNTdXR29QckRwSU13WksxbHFXblFiMTh1TXI2Skcw?=
 =?utf-8?B?em1Hc0FGZ1RTM09WdFN6OWluaHRjZ2NJSCs1QUNxR2lXQk5UMmVIaCt5UkxE?=
 =?utf-8?B?bWpzbHU4VVA5azg0bG1EZGdOZ1dlY1RnWFEvYW1WTG0xYlBkd1VMVlVkOTRx?=
 =?utf-8?B?bVNnaG8yREdnS2orUHA1bjRBWVVya2pWYkU4WGxrNDM2UE1iMlhyTHZlbGw5?=
 =?utf-8?B?SC9KWlFlOE50Vms1Z001QkhUeDlQQWlxOGo2SjMyaXg4dmRNNVNadXZiNXFu?=
 =?utf-8?B?NXB6QitVY2QyamoxZUwrYnBwS2FrWUxOYnp1RkhabS9RS200Skk2NXBPM0lN?=
 =?utf-8?B?VThPV0h4UDFub0FKNzZ2K1FxZWp6N05vb1JHUlp5M3dSQ1JPbmozVzVydUxH?=
 =?utf-8?B?dFRKb0xtcXY5Z2lwaXU5ck12N3MzcUxzOUd6VWhiTzNmekhvQ2llSTVlMUlI?=
 =?utf-8?B?TGNNNTZXKzlUMU4zSWZwK3FrVTNyQVE4Rms4RG5aMHRDdlZhU250aWNHZlcw?=
 =?utf-8?B?cFhVSXRoVXZDVXppN0YyZHRTdEJISis1c2RvS3JMVENxZG1oYUhwdjRCZEc0?=
 =?utf-8?B?US9YODdxNGxhVS9pWmpnTXhtVWdrdTV6VlIxa3BNZDVLSXVPT3pRWmdrNlJj?=
 =?utf-8?B?UVd6dkpyanp3d3dodTArQ2pQUXNLbHBNUFNiTFNqZEdUS3dySGhXZE1jSTMx?=
 =?utf-8?B?Qm0vRjVZeVFibTdycnF1UXF4enRaN3o0MHYvVkFpd1Q2eGV3QUJzbU5YWFVq?=
 =?utf-8?B?am00UWt4TXp2WmQyZGFoNUFNNEduSHp6cnJBMXhCSG1TSlMwUWpFd1VIVnk0?=
 =?utf-8?B?bDRlVmROVkl0akNvR3gzbHFHTGtyd1Vlb1BnalpmdEJJYWNCNEIyNWpETHFK?=
 =?utf-8?B?Mk90bW5XdUY3WmNxVFJwQkREeE11RmQ2eGpWdVZlbnh4R3lCSkxJVXRCWVF2?=
 =?utf-8?B?ZUUrL0xkRFNtUmN3dllybHlmMnRLYmtNMEY3Nk5KL3BGN2IzUUtVZWMwb3o1?=
 =?utf-8?B?UDNvSHlDalMrYXlzR05uRW9NRURJbjZzbWtnUW9mM1c4b0dyWmRuUElMQ0dZ?=
 =?utf-8?B?M2hpV1BxbGdjRlZxNzQxTVlLa1JWQmw5MzV0Q3E0N2VVOEcxNXk3QUpiTW8w?=
 =?utf-8?B?ejNvOEM1QTlCN3YyTktQSFJWZjdacE0xODI5aUlWbWdqWkNmNHdUd2FNcFM0?=
 =?utf-8?B?dkh4Y3FLeERxVUJVYWNVNDByOFlEaUV2bkJqeHR6VXNIVCt6RkptcUZtNHd2?=
 =?utf-8?B?ajdrc3NIaVFLNHJ1SmN0dkpMdDg4UU8vZXkzTmtkVzVLUHE2dmxkTVI2ZzBZ?=
 =?utf-8?B?Y0RhRTVxVnJsZWFEVTVrNnJaWVc5ZSs5dlh6aTZ0WEJuQ1hWdGUxRmpFTDJu?=
 =?utf-8?B?TWY2bC91dDBNSk5Qc29VQm5KSWhtMjBoRDJPTzdrYmRnN3dFdGx4eEhIRGIy?=
 =?utf-8?B?ZytlUW5sN0h6cGhvWXJGK3dmMHNWWEhOUE9IN2ZxSHJSTHpkL0p3K3R5K3FB?=
 =?utf-8?B?OHpYTzM3cGFzcHZ1b0NLUjFzWDZxNnkwVFo5Wm53K1lBOXlqbG5nREF3Mlky?=
 =?utf-8?B?UUl6czB4dHFXUUlCTGprSG9qMGdJcTNOYVh3TUdSVmlSK0ZISGpxeWp1blVi?=
 =?utf-8?Q?jtwpEKWGW7wvJN635nMQWo88nKbCeqNE1NNMl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1ac2ce-dab5-4d83-d9a7-08df44d219e9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:42:07.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o7p5gJufrNdCgrGtoI7wsFfEjNfcmaW6m5CxDYNq2LNASaRvBK927od281ZXVBKx1jUSrxylzUVT1BDNUCKfL8HyQ/h0Q86cNgOIGfwvl51YRbiKkvVUUxNy6+SbAOL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB844841

On Tue, Nov 17, 2026 at 01:45:41PM +0800, Junyi Zhao wrote:
> Hi frank，
>    thks for the review.
>
> On 17/11/2026 00:28, Frank Li wrote:
> > [ EXTERNAL EMAIL ]
> >
> > On Mon, Nov 16, 2026 at 11:12:37AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential
> > > issues to consider:
> > > - [Medium] i3c: master: svc: NULL dereference of clks[0].id in
> > >    aml_i3c_init()
> > > - [Medium] i3c: master: svc: clocks left enabled in
> > >    svc_i3c_master_remove()
> > > - [Low] i3c: master: svc: duplicate fast_clk lookup in aml_i3c_init()
> > > --
> > >
> > > commit 260aeb5a4d5c58d3bea32674062960231e4d4d2c
> > > Author: Junyi Zhao <junyi.zhao@amlogic.com>
> > >
> > > i3c: master: svc: Add amlogic a9 support
> > >
> > > This commit adds support for the Amlogic A9 EE-domain and AO-domain Silvaco
> > > I3C controllers, introducing a vendor_init callback to register the AO
> > > variant's internal clock divider chain and configure the fast_clk rate.
> > >
> > > > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> > > > index e700392f0801f..0268fc713afdf 100644
> > > > --- a/drivers/i3c/master/svc-i3c-master.c
> > > > +++ b/drivers/i3c/master/svc-i3c-master.c
> > >
> > > [ ... ]
> > >
> > > > @@ -2163,9 +2209,215 @@ static const struct svc_i3c_drvdata npcm845_drvdata = {
> > >
> > > [ ... ]
> > >
> > > > +   /*
> > > > +    * Keep the clk bulk state balanced for the following
> > > > +    * clk_bulk_disable_unprepare() calls (error paths and runtime PM).
> > > > +    */
> > > > +   ret = clk_prepare_enable(fclk);
> > > > +   if (ret)
> > > > +           return dev_err_probe(dev, ret, "can't enable fast_clk\n");
> > > > +
> > > > +   new_clks = devm_kcalloc(dev, master->num_clks + 1, sizeof(*new_clks),
> > > > +                           GFP_KERNEL);
> > > > +   if (!new_clks) {
> > > > +           clk_disable_unprepare(fclk);
> > > > +           return -ENOMEM;
> > > > +   }
> > > > +
> > > > +   memcpy(new_clks, master->clks,
> > > > +          master->num_clks * sizeof(*master->clks));
> > > > +   new_clks[master->num_clks].id = "fast_clk";
> > > > +   new_clks[master->num_clks].clk = fclk;
> > > > +   master->clks = new_clks;
> > > > +   master->num_clks++;
> > > > +
> > > > +   return 0;
> > > > +}
> > >
> > > [Severity: Medium]
> > > Can unbinding the driver leave fclk and the input clocks enabled when the
> > > device is not runtime-suspended?
> > >
> > > svc_i3c_master_remove() calls pm_runtime_dont_use_autosuspend() and
> > > pm_runtime_disable(), relying on svc_i3c_runtime_suspend() to call
> > > clk_bulk_disable_unprepare().  If CONFIG_PM is disabled, runtime PM is
> > > forbidden via sysfs, or hotjoin is enabled (which holds a runtime PM
> > > reference not released by i3c_master_unregister()), runtime suspend does
> > > not run during remove.  When devres then unregisters ao->gate.hw,
> > > ao->div.hw, and ao->div_en.hw while they are still prepared and enabled,
> > > clk_unregister() triggers a kernel warning and leaks the prepare and
> > > enable counts on the parent pclk.
> >
> > Suppose it is existing problem.
> >
> Ok， not introduced by this patch.
>
> Address it in a separate patch follow this series or create new change
> series?

New series. Many codes can be removed because framework already support
call pm_runtime_get() before tranfer data after simple set a flag.

Frank

>
> > >
> > > > +
> > > > +/**
> > > > + * aml_i3c_init - Amlogic A9 specific init, called with the clocks enabled
> > > > + * @master: I3C master controller
> > > > + *
> > > > + * Register the AO variant's internal divider chain and round/set the fast
> > > > + * clock rate for both variants.
> > > > + *
> > > > + * Return: 0 on success, or a negative error code.
> > > > + */
> > > > +static int aml_i3c_init(struct svc_i3c_master *master)
> > > > +{
> > > > +   struct device *dev = master->dev;
> > > > +   struct clk *fclk;
> > > > +   long fin_freq;
> > > > +   int ret, i;
> > > > +
> > > > +   if (svc_has_quirk(master, AML_I3C_QUIRK_AO)) {
> > > > +           /*
> > > > +            * clk_bulk_get_all() preserves the DT order, and the
> > > > +            * binding restricts the AO variant to exactly one clock,
> > > > +            * which is always "pclk".  So clks[0] is the input of the
> > > > +            * internal divider chain.
> > > > +            */
> > > > +           if (strcmp(master->clks[0].id, "pclk"))
> > > > +                   return dev_err_probe(dev, -EINVAL,
> > > > +                                        "invalid AO input clock\n");
> > >
> > > [Severity: Medium]
> > > Can this trigger a NULL pointer dereference on master->clks or
> > > master->clks[0].id?
> > >
> > > When a device tree node has no clocks, devm_clk_bulk_get_all() returns 0
> > > and leaves master->clks as NULL, which passes the master->num_clks < 0
> > > check in svc_i3c_master_probe().  Previously, the fast_clk loop in probe
> > > ran zero iterations and returned -EINVAL, but aml_i3c_init() now runs
> > > first and indexes master->clks[0] without checking that master->num_clks
> > > is at least 1 (or equal to 1 as required by the AO binding).  In addition,
> > > of_clk_bulk_get() leaves clks[i].id as NULL if clock-names is missing or
> > > shorter than clocks, which would cause strcmp() here and in the fast_clk
> > > loop below to dereference NULL.
> >
> > This one need check.
> >
>
> will add check.
>
> > Frank
> >
> > >
> > > > +
> > > > +           ret = aml_ao_i3c_tail_clocks(master, master->clks[0].clk);
> > > > +           if (ret)
> > > > +                   return ret;
> > > > +   }
> > > > +
> > > > +   for (i = 0; i < master->num_clks; i++) {
> > > > +           if (!strcmp(master->clks[i].id, "fast_clk"))
> > > > +                   break;
> > > > +   }
> > > > +
> > > > +   if (i == master->num_clks)
> > > > +           return dev_err_probe(dev, -EINVAL,
> > > > +                                "can't get I3C fast clock\n");
> > > > +
> > > > +   fclk = master->clks[i].clk;
> > > > +   if (IS_ERR(fclk))
> > > > +           return PTR_ERR(fclk);
> > >
> > > [Severity: Low]
> > > This isn't a bug, but this fast_clk lookup and validation duplicates the
> > > identical loop in svc_i3c_master_probe() that runs right after
> > > vendor_init() returns.  Could a shared helper or resolving master->fclk
> > > once avoid repeating the lookup?
> > >
> Will try.
> And guards against a NULL clks[i].id, and reused by both probe() and
> aml_i3c_init().
>
> > > --
> > > Sashiko AI review · https://sashiko.dev/#/patchset/20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com?part=2
>
