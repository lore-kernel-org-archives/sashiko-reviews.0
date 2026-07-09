Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011034.outbound.protection.outlook.com [52.103.12.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A73EDAA0
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589410; cv=fail; b=nFRymRzpXw4rdKqEW4TeWGQlEjWmeZH785eMv4heFTZVBBXFOR0vPGBrmvTRYi1J/Lh2XqJr+s8WVbDeMIzUREKjxVW1L3ydt6ci+RXsKzCGnBN5e+1IDn/mNu7WKpePiT3t+LUdpvp+CQqEJHPgnbYb22SQCPfNYYQWj2favD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589410; c=relaxed/simple;
	bh=OWCWOhZINT+aloacHBXEWqvkehZUdJI5PP4C6MO62T0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sdl0z1GHc7L64kGWJEb7By1xFRrkd9yf1a3CL/dnvAQacvxj7gHudR03m0n7dq55l9P2qRgaWNLGThcPAUUVCOkendo55ZifsYqphKhAZ1hAOsCtgozU6ItZEwPtQ+291TL9YqtxcAd5r2MkVsQOS8GXCnuYEP0mkcKvO9l28nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JYNnVs2A; arc=fail smtp.client-ip=52.103.12.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="JYNnVs2A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OG9esgEQLqND6aECvAM+vG6MPCf+JnXM5CZfK2L39s/dWQAeeJIe/qoUqkVEVnnuTqK0cC3H0qg0+TRVcbuZ+hT24+V9roXQjRm5+WcCgVsuR2+eoGdOcZaEvdw+ybInsCqUserPcsxfdmbhnzgsseYPXsVuDJQxY7PVu7N7aOmB2lV+/BQa/+V0gLu4xIiXTQ58qg96gds1/FfCCrgn8850zF+gSkvxHhowMWtmvnuLTxGSABhjO0AmTF7nvhf6KNd3GxzkoUbbhYOKHrf1/teSVwvdS5Ebe/l+TryfZNJSdSZIMhYl1ZyKNygSF1n5/z/rY/vuATR1nbicSdkLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rb4kBhPHdndYzWSW3s/rV4fk6N4qWG/BtCibSI2q+gU=;
 b=v5SRUdDGmlwIPkNWoyRUCrL97Q26EOX0Ec1bNGiIvje4k2NucfLfTqxYrTXFkS/Lscfhw9QceSeYvwV/l6iw73bm1/ZWs2As0Mt2ei/M5+4VyhvqkeusPFvLK7W/FhnmH6BgDHcoxr09KYPLHY9WTCWMvDtQeXCYRyPu8TSae4hbVyR3otqgQMOnraw1v878x8kZ+zHdfZq+P8dZWwNWCJOftfdcVQUfFe8mUJ28tLGJXfgAXhE2UxO+ZFhqU3Eo2QuFcufmdwvRMdWexLz4T96oIgrKZp4dek/syqy8rLm2HcrYhgJ/b0mU4waptmM2p2dQ3Rb++ocsfeqkgSIrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rb4kBhPHdndYzWSW3s/rV4fk6N4qWG/BtCibSI2q+gU=;
 b=JYNnVs2AsgamtYNjChEi61csTXa1tBENYgWzDpOj35xqDGidSL0SeKfFOcKGtCKCLPehoJ0tOZfHWkawZ/di99XSDjCls1dturpCvt9bZI11JeLA1ZwlR+4ujFIK7l1+sUMDupCpqlii98ip2n8ahJv8v00M4UCSWFBhhgb3pfvhtkC08Y0LX6XqU6tLNUS+wB+ea1OB5nqWS8SOHrWmJ2S4Dxlz4Y5Mt4SUDJEOzaw5jV7LsX89wlUiqoRtRtwJvZtGfARi8iRWwVTRfzcV2Cdr1bNC1WTb6acxYwE79/NDhPj5DTB2BE1ij5X/UwExGpK1qgdVInoITACCsLrOzQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by BY3PR19MB4993.namprd19.prod.outlook.com (2603:10b6:a03:36f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 09:30:05 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 09:30:03 +0000
Message-ID:
 <SN7PR19MB6736E43DFD0F563C3D31F52C9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 9 Jul 2026 13:29:55 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
To: sashiko-reviews@lists.linux.dev, Bartosz Golaszewski <brgl@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-3-e476c41f03b8@outlook.com>
 <20260709092720.973B21F000E9@smtp.kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260709092720.973B21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0010.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::16) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <770ce900-e086-4a22-b075-b27733b80437@outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|BY3PR19MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: 6400d573-a757-4444-2b8a-08dedd9ca6f7
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnrlC5lHdFGci+YUsdS3F/CI0YQmwsdw1t3W92hJFQxPiNNgHFJQensCfFfyIcTiZFKDHKJfYIFQOnq3hW5JlDJPKGrdvIBkgReiPRBNySHrvOuox1Us1hQOdLIsHcuRBjvOjYnp1Y3PH945+wDA57iwIwG4k4wPu/GuSfT4yEhHDYY5/ptVx8/J3lAhbQKOLI33kfSGnCyz5FGEv+RvX9FjmIkXUd+DJQ4N9pF0OOeKsKYPXvjDr6myDYl6ih/zUGRiAS7yhS1FXL/l84sBkedBjbLKQddKiBJII993zgueYCC4NYM3dr6ibtV/qtMNsLBZ9UpXs3Yw5glcSS9J+Ruptn1+QEJ/xmI6EdSi9jwu2k3u9KrqKfT7syP2+oJGQsfgKmnoVfkKDGfpKwcg+kkaEC4lpsB93yH2zBBAncVkNN1DsuEeJ5GjbyCDfkl+bwbzK2cmCmc8FYhHEWdL3/5zGfzZo+CaD5pjFNUlu7H01R7okdVIx/7d6oVDXP+c0J4UuTNRME9E/uvzsW/asW/nvQDtu1gXeXDULioJYVazu7D5kEfUhdStm728BSw3HHz1HidgIVHsu3h7TtoYqGykVAsvyekFrzrbXFEHwdNvoJRNVAAzjYB1nUZIqgpVIgh+uy8Xj3HWumxzfiUHcQyV01AHKOJjLOzNcSIXKXXLDZYMZ8EPUC7Jl8mns0sEuvN3Yg8+ARnWlTx4XkSPDlJvS9k4c58XnLM4hk6j7McWGo4+jJFRxGHnXR/eIza+ZdI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|41001999006|8060799015|6090799003|19110799012|4140399003|37011999003|23021999003|15080799012|51005399006|25010399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXlYQlFyazg0Wlo4ZTJGOEpQTytkS1ZLdjh0cS9LT3FvRGUvNVF6cmhaTzBV?=
 =?utf-8?B?OXAwdlRhRVFrd1J2ckFobmhON3ZtN0gzdHJpdDZUc1RIV2cxWVpORFh1Z1B5?=
 =?utf-8?B?cHJCVm4vL3lPR1NUd1Q3RVUwYmhaby84RWRQN0tzOGs3OGR2dHJ3RGlkZFFk?=
 =?utf-8?B?SG5ZYWVlQS8yaEhYV2dCVDdOTmQ0NTZuV1c2TEhDZDNLdW9FYkcrTFIyZHY5?=
 =?utf-8?B?YXBGa1hTeGJNQm9TUVVqRWF4QnJpMXBSMDY3ei9ITjd0OUhtNVpmOUp3MFVu?=
 =?utf-8?B?WEh4eUhmTHF0SzhLRDgwc3k2eHVXOW9TQWV2dm5XdWk3OFlrK1RMZ2JkcXBB?=
 =?utf-8?B?eEE1ZG1EZXgrQS9JMkhRL011ZnFiRlpsZzN4RGh2RzQ0NWpRZ21mRGd3VWQr?=
 =?utf-8?B?MUZJenV6L0ZBWXJkZTJtS0FENUxuOC94VWZaKzJEVWZJVFlXYkxHYXlhM090?=
 =?utf-8?B?SUVkSkJRdjh3UDA3eDhHWTE4d0RiT2FVbGNIdEdSZitKdlNRZFlocndvakxz?=
 =?utf-8?B?cTZ6S0x3WEM0WW5Vd1BObE40a1RYd1B1NDFGWSs2SW5KNWdPTVBubkNQaEd6?=
 =?utf-8?B?cllTOVZGQUNpTGpzMWc4WkNqTzJsNzh5dnJmUVJ5SzV4SFRZUzZRRDdtc2g2?=
 =?utf-8?B?UkJTYjMrTnRtTVFnUWdncEFtSEFzUXUvbEg1RXhyMEpOdzNkV0xZUWdXeTNT?=
 =?utf-8?B?VFc5eXkzNHBHUWpkYTlWaDB2NTh4VndQUTN3QzdkdnppOFFHTU56TGQ2blpl?=
 =?utf-8?B?Q1B5dHFkQ1lYUXovMmR6Z200eUVLTlY1Q1NyTlZyQytqaGRLTDVxck5uS3NH?=
 =?utf-8?B?UUw4NnpHWng0bm0zUFFKQkNhUWEwMG8zdjRPQzMwRUZTR01NVzMveC9VSFpZ?=
 =?utf-8?B?RXB6ckZSdVJqRVBqUnNKUHVqeHgzTU5xYUZKdDhrbDN5b1FlNXd2YnVzNU1z?=
 =?utf-8?B?YzZOdGtFaEFrRmNZNndvaDBlMElDM1d1c29abkd4RXVCMFBJdzZpbCt0ZjJC?=
 =?utf-8?B?MlZhVjhRaHREb3NzdHJTb2RTcUJGSHpzTlBQUG9lRzlKd1EvejFVc1g2UnlK?=
 =?utf-8?B?UVdLT3FKTlVqNFFSYW5tdUwzbzBtNkJ5M1F4Tkx6dHc2RjlWRWJWR0VwUjVS?=
 =?utf-8?B?T1BxSlFac1dHcC8wQjV6TVR1SmZwNWdORHQxZnl2eFpxZ3Zmd0YwK1ZDdFRo?=
 =?utf-8?B?bjBFWXA0QlZSTTA1RTAxT3dpRDdvY1kxSGhnTlJZTmtZYm5GVEJWZ3FUOXJY?=
 =?utf-8?B?SURUUjIxY1IxV1phOUt4NHg5Q05uWDdXWVlHYzNqZWd4L0wrMlJPTlh6MGlB?=
 =?utf-8?B?cG9EU2YwS1VwUEVvMFN5RS9nbWRNbW00T0RoV3FUeURaK0llUStZaWtzS3VV?=
 =?utf-8?B?R3kyOFc5T0E3MWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmVjQU5oR3d3MGNuWjF0cjRlcUpMOVBBdTZUNVJtbUs1MFN2eXJJZk4xemZO?=
 =?utf-8?B?RDY3VEx0YVUwWEpaNEh0Y3QvajNhY2MvY1ljb0EyWS82ZjkrZjIwYk1WRkVV?=
 =?utf-8?B?ZlU1SEdta0ZNd1F6Z1Z4TkZXL2xTamlHWTloNTBobXFMMGZyNzRlWElVS1N6?=
 =?utf-8?B?QTJpRG1vamh5MEFIV2VCMkJBMnlnNVZTZkltUGhrRUE2NkdmTUFmanVQRFpL?=
 =?utf-8?B?UkVOK1dpSjZlWVRmSWF4YStQSmYybTRjYWZONGZpdDk2RHFSNGlna0xxWHNW?=
 =?utf-8?B?bXMvalhJTFdFU04xampuWUhkdG5PcFBSSldzZUEvazhkMjAzdDh3dk9tT1hr?=
 =?utf-8?B?MEozNDFpQ3hiUjdCQjhwODdYbnlzMWpEb2FjTC94K0NONStRbTZ1WWRQTDNR?=
 =?utf-8?B?Mlh5dFJZaVQyRnBQTTJKajhQcUdDQ29GeEJqWkdUdm5xdmNIc1o3V1UrSHZ1?=
 =?utf-8?B?bmpiOUVicmk3U3FHRFdXVFhCVW9ZaXJnUGV3cVZMZnBQN3lKTVpRRW5VeTdZ?=
 =?utf-8?B?azNVSkdteEhjendXWjRNVlI0WllPMmNZbEo4WUJQM3V2SDZBd3FtRTBtOEky?=
 =?utf-8?B?dVpheXJVdS9VUldSQnlZVGNOejJjOXZrS1pSRFJ3eXdpY0p6aU5meVRZcnZo?=
 =?utf-8?B?VU1YOUZONXJ1NWJGczZzUFpIQWlXbjFOTlgrclZIWCtUbVZSc0xra21zSEti?=
 =?utf-8?B?djVacGhLZkhXRkpyNE91T0RMQmN0b2xCMTRUemdmb2x4VEhOSXRMM3Q1cU5k?=
 =?utf-8?B?QjN3TlFYY1pFQkt1K3lQRSt6NURNcXpHVlErc3crdVZMMkFyQUMzNDJPNjdp?=
 =?utf-8?B?VUNTZzB5dUplcENtODIvUXNERXg3UWhOdnVMTis0bEdsbVQ0Rlc4NERJOStF?=
 =?utf-8?B?TWZvZTMybWFOREpsdkFKVU9naWxqa2hsTVpGRzdLU1U1WVlST0J3RzNuek00?=
 =?utf-8?B?c0Q3Z1JENmg4VTdJUmVVOFI0SFhrUFdoN1I0NjdsL3Vpb0kxYlg4QUtqc3Mx?=
 =?utf-8?B?QlVESGRrbEQxNHhrVUpiZlVyS2FFTzJ3WWZpQ2p5STlkMExlVVlLVmpkMFJG?=
 =?utf-8?B?bklJU2VIMmZ0MmFZWEFaNEg1dnYrZTBvVjVvQ2xtZ0R1cEJDTVR0T0NWcTFj?=
 =?utf-8?B?dlhHV3hNSmQwU0ptR09mRDducVdLalVMcEZkRFdlaUN1ZmRRcjVoTUVhZjI0?=
 =?utf-8?B?QnNuQmdRMGxxbFRGd1dTRlYwd0gzOW5WRW1pQ1lvNFVQRmxIUll4d3pnRTFr?=
 =?utf-8?B?NXdTMlVwS3NlZDB1YXN1Vi9iVU5zcEsvWTVlOFV3Qk4ybDhjNGRrSWFxTUpW?=
 =?utf-8?B?Q0k3VVhuV3lxV3Byd0UwaHRyMmJ2aWlDRSsvZWkxWDh2Y1ZwUW9XZHhlYTRG?=
 =?utf-8?B?SlhSalcwd3hoeDdnU2N0djZiYkJDUHJjU2ZnM1ZWd2llMTNyRDhvMEFXaExR?=
 =?utf-8?B?UXhuMWlWVFNRNEtJOGI4ZXczdGs3VHBQSWNUaVQvZHlJdkJrTTU2c01MaktP?=
 =?utf-8?B?eE5PamhPbXN0bXFUcVgzMnlUdEp6MWw3NWlFK1lTKzkyc1BvT1VILzNpeGE5?=
 =?utf-8?B?RDNCSHZKQTZiRGtZUnJTdmMzOExDUWNRMmxJMUw2L2dRZW9ndFdTaFZYMXpQ?=
 =?utf-8?B?QXZLeEhCS1hhUDkzTTA0TlRSeGxXOFZYQzB1NE9vOG0vbXJKdE95YkFmNmwv?=
 =?utf-8?B?SHJlb3VtRzVHKzBtR3E4SlZKdXdHMUc4Wlp3OWJETnVoQklSMGhZeVdWYi9T?=
 =?utf-8?B?aHhkUmE2d1gvbzRXMFhIbXRyS2JFVHBndFEyem52SnRPTWgrNzJlb0J2L0tm?=
 =?utf-8?B?K2Z0NzFkaHBUd0Y0WUpvcnArak5oYmZXVjdxcTJsbktMYVZvZ1dDRW1ZOG85?=
 =?utf-8?B?VE1ua2R4QnFZckUvWSsvMUNVSnFidlhLVStLUGJjRWJ2Mnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6400d573-a757-4444-2b8a-08dedd9ca6f7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:30:03.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4993

adding Bartosz, Konrad, and Dmitry for awareness.

On 7/9/26 13:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The new `QCOM_SCM_PIL_PAS_BT_PWR_MODE` macro uses the exact same command ID (`0x21`) as the existing `QCOM_SCM_PIL_PAS_GET_RSCTABLE` macro within the `QCOM_SCM_SVC_PIL` service.
> --
> 
> --- Patch [3]: [PATCH v5 3/6] firmware: qcom: scm: Add support for setting Bluetooth power modes ---
> commit 7001f29bdf69c1e84287e5d8734b48feda414e41
> Author: George Moussalem <george.moussalem@outlook.com>
> 
> firmware: qcom: scm: Add support for setting Bluetooth power modes
> 
> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
> modes which are configured through a Secure Channel Manager (SCM) call to
> TrustZone. This commit adds a function to perform this call after checking
> if the feature is supported by the QSEE image.
> 
>> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
>> index caab80a73e17f..5579df5a2aca7 100644
>> --- a/drivers/firmware/qcom/qcom_scm.h
>> +++ b/drivers/firmware/qcom/qcom_scm.h
>> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
>> +#define QCOM_SCM_PIL_PAS_BT_PWR_MODE	0x21
>>  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
> 
> [Severity: High]
> Is it intended for QCOM_SCM_PIL_PAS_BT_PWR_MODE to use the exact same
> command ID (0x21) as QCOM_SCM_PIL_PAS_GET_RSCTABLE?

Yes, this is intended. This is the documented power mode register for
Bluetooth on IPQ5018.

> 
> Because both definitions share 0x21 within the QCOM_SCM_SVC_PIL service,
> when __qcom_scm_is_call_available() queries the firmware for
> QCOM_SCM_PIL_PAS_BT_PWR_MODE, it will falsely return true on any SoC that
> already supports GET_RSCTABLE.
> 
> This would allow qcom_scm_pas_set_bluetooth_power_mode() to incorrectly
> proceed and execute a 2-argument SCM call to TrustZone. Could this cause
> the firmware to route the call to the GET_RSCTABLE handler (which expects
> 5 arguments, including physical addresses for DMA), potentially leading
> to a Secure World memory fault?
> 

Best regards,
George
