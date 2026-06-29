Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023083.outbound.protection.outlook.com [52.101.83.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C071ACEDE
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740307; cv=fail; b=GsLx7n8f3XRn7pARXxILTsz24M7cQfQduUnFzU3gWfw11DEZy9VtALO0fCU12sXKZlKkXp3DsTAt31p6Q0ZFv8lYzM3vnOXZSj1kup0sTXYd1vNE6ArYsFDKNziIhe1ZVLWogb0Fio1mBdp/Ndb4DtpcAavqV3NodZ+EQvTsIS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740307; c=relaxed/simple;
	bh=yzdBUeG1vOIsPR6UmzBoEhHhIQKys6x+V5jdJvqZpUU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ba/Ut1zA/CYSWAi2cSmqayX6yjb6Tuz7zsT55LYY/TaRVuZiNNp/U/tWt769GbtL4D501xlaj4Fe9Q5WVzB0f4ZPIlBnwdB2gpA2N0+w85vUr295Anun7jsnrbxQXhrXFxx2vIsWK7+zysO72yJgsfqV2l4/WVVLDxUBH19K3qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=VCAJWCQz; arc=fail smtp.client-ip=52.101.83.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="VCAJWCQz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypkhqO0BFhhkoHfBraaE3L54usgr4qqaArv1wGt5nYRTjhxBNd5sJlGwD0rLhowW1T6ZQ03wGc7peJP5BJ0EEGXfjyRTIsQre1gZLP2JAIURtmAexp1mThaAZvW5bF6B7IHSWgvTOVs67oSrHJpZMUvAzWkQeZf6XXcmMwoLvYOGCUoA8drMg9+LlCmbsDlgLRqOHBxcQ7809wZltYgOw++yMyEKJeXrqgW1Lcds3VdjtQbX5cTLMcUO65HYJE3SRRSn+hR+zumL2PPXUPXQkhWS02opaldg1jdCRZkID9CagFJ5ERTLB7rWnDEVHO0+Ql7XCtJkeXLbrZbpk7bBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz3T92n2bN0PSHocIxl3BBzXF25F6ofpqGcDZYTa9MM=;
 b=tPXtVdB/OxW4OMK0L18qe2gCJHYJQh8zdVl25Tj8NB8Dp12k+80E9ME3GyJsJePEZvOLTgABEZ/FFQWhG0S2wXIAVgwTiqxk3H31w00EO0YsWOBj2P51xNqVlMMy81HrFQA39Ca2+bW56PlrtlNxlFtPCfNUVihdfI8eP6rhwvPcKRj63VTA/2R31le4XlqVY651PBlzTY0Nve/7H1MS7Aa7TkRUzk/1N3On+HOCXW1hBPREvsiZgFTIMogvyrkkCX8Eywv8yS9G6x+PRSVN6AdHchvkbE22lojhrJMBNnxi1Ait4+qPzGZams/3Ortf1Rxo9U/4TlTqqZ1eb40IvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz3T92n2bN0PSHocIxl3BBzXF25F6ofpqGcDZYTa9MM=;
 b=VCAJWCQzqUirUU6D2ta9K2DwVjaj88pU5boTeRrFGrVqtYulSqLGUDprV/AoaXq5z49pCfJSj78KpulG7UNn6dObr79c/+Rg9BJlQYYNVBSqNy5DKiKoIE5Zr/0++ZFHH6I80+rCoYlHSwo3DdM2ny77AwYrM5LUrVZVh0qHSnwXIqRJkNw09qI02fcd8Y+5EbswqC60K8nzksx6cOouePBsr6FBewE04GOuJHh2am1DIWmXo0UBFrXByOy1f1Dr2P2f5p4giQ25Xr6UmVTkuJZ0aHnCSdi0gD3YwwFrRc0PG6+G+81N3xlAMHz0YYkT055iQyvY8nr7NUGL9Tx1KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by PAWP195MB2350.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:366::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 13:38:19 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 13:38:19 +0000
Message-ID: <7e6fb960-e3fc-4923-adf3-c2a289780332@phytec.de>
Date: Mon, 29 Jun 2026 16:38:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH v2 2/2] arm64: dts: ti: Add support for the
 phyCORE-AM67x
To: Nathan Morrisson <nmorrisson@phytec.com>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: afd@ti.com, sashiko-reviews@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260626161014.1146128-1-nmorrisson@phytec.com>
 <20260626161014.1146128-2-nmorrisson@phytec.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20260626161014.1146128-2-nmorrisson@phytec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0212.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::27) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|PAWP195MB2350:EE_
X-MS-Office365-Filtering-Correlation-Id: b72e86f9-85f8-4078-483c-08ded5e3ae51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|10070799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5xQgUbjnH2gGIJrljWNRu8HRkrugd+btOP4RoeYJyS/v0yeYuix3UP1Xjf9EH6YMegRAcyI4ILPZi7Hm6giV1aBnqq4YYsg8+G6oDZqCztRpKqPA1flb6Zem3ZzB15CaxTcaRJ1fpabE1Z0JJqarFhnxsogt29s/8GPl4srEP/4qUTyT6Exmi0qnvaeyRVSVAS+/Sd7FGA7v4wT6dEaqbcxerNCo3177IGvHHVQea+AEUzL2006bXE998rNoFymDh7gPIsBCkU3houl6i9O78i+yKOFHlRbucAMKNTGF0qLQYxZtEIzAiB+U8cQGUcRKa13qMVQ+h9zvo9DVHacqEGrgztKzaTT6/OqUbdd7WYwsyhfR2BZO/JfiwxJlT45bjwFLaUha6B9idHOMcEuf3LXYwNOSsq3LIKyql2uAtRMJ8vR7uCT5jVppv7EOvq/T5uNIrFXzEnZs9HNXc0v7LTmgxZEdCaKozPKzdGttl6Lgo4Uw6ALlzG0zFoVuJvn16Qxt8gz4rHcxFXcEEl6FteJ38XpvRu841qo4DUjeMKvRKgLUuMbjRRuShPS7WKXcj6NgHuh1ca0Dd4OMEBCtjRQRCruklvbn16TsXcWLuFFkEt9b4mPmZXEfzI2rlGapDJd7D8MyjGjv+2vTxmlRlyTU4kTdpfn67CJwufykwAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(10070799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1FFaHBYNm55ZkZ1KzM2MUZyOHIwOGhBSGtyNjhRa1dZQThNeEJ5NnpicjRh?=
 =?utf-8?B?b09MUzU0bUdFa2REdHlleHljMWZlL1RYS05LTFlJMFFic25SejBWc0VyUTFY?=
 =?utf-8?B?dytlZW5IRjNrN1ZncVlITkR4d3hCOW84ZmlYQXRaQWw4N3BJNThGelROam84?=
 =?utf-8?B?ZzFsM0hyRUtWMFlqZ1IwS1dZbU1uUm14c2hDTm9ERElUeXIrUVFLRUp4dWY1?=
 =?utf-8?B?YTQ0aHhZUGZ1Q0I2WEl1UjNxWmtacnk3L1dxY3lnY2JjOTJURGVCeU1LQVBW?=
 =?utf-8?B?TzNVeVpxZG5pUEFmMkl5WVlVS3QyR2NleTFoam5EVnNhL2FRNXgrNndJc3M1?=
 =?utf-8?B?bnp4UklsbWJJLzlwc29lZmFJdVc4MTUvTlZGTFZMZmRZMm5NLzdoSUJIM212?=
 =?utf-8?B?NzRlZEtuM2JjWlRoM3VoZGorMTZTRE5pMUxMZWRPY2RsdXA3d3dpMnd3NXl3?=
 =?utf-8?B?SWtscUd1Qk1vM3N0bFBVMjhEanhaMS9Ia1hFY003VzNKd25yVkhBcDJzVVly?=
 =?utf-8?B?dnM3ZE54dnR4QnlFUjM5V2JBRnoreWdTUGZkRFBpY01UTHdNREhGNEFkYnpM?=
 =?utf-8?B?Nmd0RUdPYWloQXRsUGsrT1llUVpmKzdyOU1wMDh5NytsN1dOVjNyUjVSSGgw?=
 =?utf-8?B?cW9qMnQ3YWlybU4rOWxySXN0MklJaHdnc01jV3E4WDc0VnBKNDJqcVB2dkgz?=
 =?utf-8?B?UlltMGRpd2twWjRPd0dUQVhCaG9UbVhlR0x1UW9CUWIxSmIrTU1xSjRjbmha?=
 =?utf-8?B?Mkt1L3QwZkJHTm0vM3MyMlFvVzhKUG42RTFoM2l2eEYvcXM5S1dYVmo4ell5?=
 =?utf-8?B?RXQ4Z0phZ1JyYjEwWEtDYjZIdXNLb0UxZlh1OS8yRHljQ3IvMUs5d1N6Ylp0?=
 =?utf-8?B?MDVoTlZJbjJSMVNXTG4rNFJXaGNSaXI0UEJDbnBBbDlpVDJFTms1SnZ1aHFS?=
 =?utf-8?B?L2VhUldKaFBFRHFBS3lQSW5veER3aTEzWkxkMTZTa0p0TmZ1WXlTY29OWXV4?=
 =?utf-8?B?QVlMbGo5NzQxWWZaOExRMDJnVXBJMjBuN256aENyK1FmYTNWRzVpZlJnaUNW?=
 =?utf-8?B?UXMyVW5XenVLRTlsaUdNL2p5WHZlaW1OYVlFaGdFOU00c3BHTUhhWStTdUZo?=
 =?utf-8?B?VzZzL2diWURWKzB3MmhjeEhzVTVBTm5kRkc2Tk11TWJWcStkZW1oRzdZNnoz?=
 =?utf-8?B?L0EwZmloR1gvSm5IakYvSnp6VTV4YU9palp4TENWTTNlOWZabXlJSWkyMG9I?=
 =?utf-8?B?MDQ0NkVTTDkvaklGaG8ySE5qa0czd3hzL29Ibld3bzJ6anBtODFIZ1BOK0xG?=
 =?utf-8?B?R0xZUndLWU8wMklneEU2RXI3WDcxM2hkc3ZRd1FFQlpaRytpam9XZURmZ0Q1?=
 =?utf-8?B?TDlzNDdRZEVLWDVwaUV4eUo4dy9IdmJJL2lIcDB4cFpwSEdsdTNHSFRVTW9V?=
 =?utf-8?B?S2xPL0o2dUszMkFWc0J0cUNCL1AyQVhWRkprZTVaQUlNVnFxOGs1WExpaSsr?=
 =?utf-8?B?WDVaMnRwM0QxSTdKOVV2dW5lWU11NnVjZHkwRzVRc3poN240cXlJRHpzdWRk?=
 =?utf-8?B?NHYvWDhuTFRzd1NrcFFySVlmN3l1MDZsYzhML3F2RDlreWJkUm5tOER6SE5O?=
 =?utf-8?B?WC92dzFOMWtCbmJhZlBXK2hLQlIzYkRYQk1QdkpKWVA4WExuclR3SlNHUENr?=
 =?utf-8?B?T0trWU5HYmdpUXk2OC92dFJYcEVYTUNpaDVNN1dIZzlsaEJoTEpvUW11ejd1?=
 =?utf-8?B?OUhidVBjTENPT2Rwd3JUa0YwbFhmUk9IUVJ3TkJNV3lIUnRjTm9tQ0xEMk5K?=
 =?utf-8?B?WDBlTDA3bG1lbk9hOThEMWlBL245cVBNNTJIQm9ubGJFSDNnc3JFN3ZOeER5?=
 =?utf-8?B?dS82Q2NSNHA3ZDdES09nUzh1d0FWeXpoYmFEQTFHc21FaVBneVlxWkQ2dnNF?=
 =?utf-8?B?UHl3SUdEQ3FrUFZkNVhsdGJ0ZnFSeFZQcE5Ranc3V2l2QWFYTWNvWm1oelVw?=
 =?utf-8?B?YUJSQ2dLSFR6Z00wOVpsQTNUaWxvdWxBZVhaVnlraTBKeGxBWHd6WFZESitN?=
 =?utf-8?B?MnV2eU5RSzV1cG9YN1VVaTVTRllKVFVZUFhLYVF0VnNlK3UyM1BWM2JMelhU?=
 =?utf-8?B?NFZSeW1SdS9vd2JRSXBoeU5WakNqWFl2VSs2QXJtQWxVUGR2elI0Z0MzeGwy?=
 =?utf-8?B?N2hrdzVSQWNpTUVDck9GaFF3SEZxUHlLWmswcUl5UVJaK09XSFU4eUovQ2F5?=
 =?utf-8?B?MWFXaGVKdzJWaHFTQ2FXL29USk1KR1hvMi9WQmh3UjJUZzN2YlFZeGlDdjZN?=
 =?utf-8?B?MlhzUnRteUgwTjlBU3RKeFVzaHlkQndqV2ZPOHlya1FSZlZXRDR1NHk3MjVl?=
 =?utf-8?Q?gAEk2w2Ud0V0SGV0V137wjo7clSKNiU+9YnaQtNcPurAp?=
X-MS-Exchange-AntiSpam-MessageData-1: +Q8OYPlZOPhV/A==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b72e86f9-85f8-4078-483c-08ded5e3ae51
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:38:19.3916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9B8ZtaZ0bYKZuRVvufVRgJM0oEqJx5HgeeAUKSY0y09JD7sVpZYpFsuyflLeVw2uz4i53Lj/p99UA3VLUo42GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2350



On 6/26/26 7:10 PM, Nathan Morrisson wrote:
> Add support for the PHYTEC phyCORE-AM67x SoM [1] and the
> corresponding phyBOARD-Rigel carrier board [2]. The phyCORE-AM67x SoM
> uses the TI AM67x SoC and can come with different sizes and models of
> DDR, eMMC, and SPI NOR Flash.
> 
> Supported features:
>   * Audio playback and recording
>   * CAN
>   * Debug UART
>   * eMMC
>   * Ethernet
>   * GPIO buttons
>   * Heartbeat LED
>   * I2C Current sensor
>   * I2C EEPROM
>   * I2C Light sensor
>   * I2C RTC
>   * Micro SD card
>   * PCIe
>   * SPI NOR flash
>   * USB
> 
> [1] https://www.phytec.com/product/phycore-am67x/
> [2] https://www.phytec.com/product/phyboard-am67x-development-kit/
> 
> Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>

Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
