Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8113C2798;
	Thu, 13 Aug 2026 05:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786598958; cv=fail; b=sF1rBEunH1aM3kHfBfoZX8nfV3aPNHjwG+u4BDGLDFeo3OzuOtH3jejXeG6H3z+7N82CUt9k3Q0p7dBj1gYJ379yZpIhqBeLfndOKcDFN7gAmSOEs1dlAHX5x02wfUhGZu3JqJBaSCx/uiBH3DtaVRlyjotkvLFGjgNfojeaB84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786598958; c=relaxed/simple;
	bh=SYPPTiH2nU8u0JKS2FFqHHtAVG1fImVjK3tNK9SgTy0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CL0yKy3KKldfF/ucpCqpD4b5w/Vzo2o4EvoTOpGaPeyHw4kAjSLL60gaPY09MHDpdwk9pHLxAVM4OpdweZUXvuv9iT4RrU5f/Z7V1voo6f8HfG2f57UNeXGl5YW06V1T1+bakiukfk2JXKxgWfvd1TA90ZNACHi35vVxcPpfkIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fG0geJhw; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fG0geJhw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MInG5VY2Kl/Qr11p1eagkfNg/WJH1CE/WHTNd2spsid5ZcMh1RsplYU9qDNqIhAhHxb5zY9XVCIeoinbhL5YxPll704k1JNih17fD/pKZo8hbtITLnM+2iuN4XbJw+XMC5NdvAfrFsO+0KbDtHKPy2KWTrXTL1VHxZTHPmaUyOY1zHoc+MPcfTbQ/tF7iLj6HWqArG/iqfEmkdVOYabRHDkNW04jnv2SCPR7lb4SVtJvrSBsPo22tTyP6JgSMI+xzqBirIylj8d+Yhl3CRL2ePmPmhCkb8ifnlKpj6pFNA4W0yq0B6Sd2vQubjzzPOOEfmCl+QJOs60d7InwMwKbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYPPTiH2nU8u0JKS2FFqHHtAVG1fImVjK3tNK9SgTy0=;
 b=F8IAd7oavIrVTgR+MG7OK8ky1Q3rEaWl///r1plRIP0QFwUD5mt+MsqJXZsjpwSbSUO4CGCDEne2keYr1FMTaM9Q1+frkhsSLR50Ac4SYkUWOzPBSKS5tnKt4dimvTQzxmuY5ztBP86801Y2ik9zYLBr4Fs++DgJLnghKr3xSUJ2ALq/1IsP+8pRmC0InbVHqY2Ook6YKatQocLI4sCg2euQFIoSOrICUknzY1HtwW1dDkS9T4ef0Ud9ajgsJm9lBJ+ybXAvHh+jGzqeLPX+A1AJFMkf9ZxnaTCyR04ukuhXS0j2G4VEchf3s9IT2YmgXX2QmlbOus9D+v9TK7h1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYPPTiH2nU8u0JKS2FFqHHtAVG1fImVjK3tNK9SgTy0=;
 b=fG0geJhw1Uk9PPSbRuZT+DcYpzXAFotUbgAZ9UcpM++Vta7mDhp/w41nkZiPEKjL/zWrUNxTtZ1WfZOH/7lFkEDgiN4e6B0m2rh+d2BROl5XwgmhrRlvdMJQHEAeu8i//nTtcqGNSgAwEoidIHoryl4knUezWIdqlGIi84hgTea+ZOkXtayaoppEht366RJojX5zCPyISKLtpbq/1G4MEobW6fyOfWNv8wgSTi/hVyzMNDowyqVh214Ddh8y9UHLWLqYYnSbUhFKty5LTPUfOrh2JeZegRYe5ifnFUz+vAypOsTyPPSYk15bJGuMMQ7O1JxVPieb+ARKdrMAX5x7OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAWPR04MB10029.eurprd04.prod.outlook.com (2603:10a6:102:380::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 05:29:04 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 05:29:04 +0000
Message-ID: <536631d2-b4fa-4f73-adcf-dd76744989be@oss.nxp.com>
Date: Thu, 13 Aug 2026 08:32:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
To: sashiko-reviews@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>,
 konradybcio@kernel.org
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
 <20260812151934.709198-2-daniel.baluta@nxp.com>
 <20260812155001.6A2D51F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260812155001.6A2D51F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P309CA0021.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::30) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAWPR04MB10029:EE_
X-MS-Office365-Filtering-Correlation-Id: 3025e7a5-a337-4a6c-1871-08def8fbca0a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mD9stsq5woCDJmauUSR/gtrZrZuKVpwZZfvk7wTgkKOdHUs7LmMoYQixH2hMERXODRgGkaIfKKHxEfDJ6GsjrHjqxNzgRP71YP7zyIMcXJdWF+QytZLw7C1fqWASGYHVNazOv3cPUvPlrgK9hbJjn1kAATmTNl8jkgKweJa6MvULqB+bRxGCFzoIzb91C12wjNLgsAKyGn/t/FoKirx8fZwXNhPpRTSPnzGJFP3Gl/D0OszTSlHuOTyW4BdzU+nKQwQELotavqugzHkYX0ErkFHM52UWnhnFbaFVqhd0yemDgYvu6m5KOTZxUZffGgs8jnr10q//wRvJJODuvZv6XGhLFN5ce1ZeLNaUMIzgDLlS7nWf9FSP/BTb9mOTp4+QNg+H9NdJhJWJmPDVl4X5pZH+MueRLdgkYmIDyfz/lhJTgYWTZ3CbTUqRBmSnhS/YYaGSXHEoe6vzsPK+mzpzzl72cO2DXWR0+ajIEhI+5wD9lNMIAC1waJDHhQoTcrJ+pJ0QNUX9oQZJdb7nRY58+F20BbyYp+31pF+Pu37amOq7DDTv6Xly3hxNuQsV2SZqi6gJ9JrGnrRCmgUQNpYBI/i5VSkYrN9qpMlafgz87Y9+nVqBeGKr4KFjqlwciHfM9WtR/LGNpXcj1xvCq6BSYAurN551gXCZ+OsiOcAmNfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlUTjJMYWQ2dlhMQ1kyOStNVmdUWHdpM3kxMVM3YkRvT0JuWkJXSnFBeExS?=
 =?utf-8?B?ZEhyM05nK1l4MTZTMWQ1Z0JxdisvZktrR2RLZTY0MWpvUUc3T2M5OWZGeWk3?=
 =?utf-8?B?QWEzTTRFN0dmZ0VDeW9rK09MSmczUDh4eFl6djZ3eWsza1pLVmpqaStaTG5h?=
 =?utf-8?B?RnBGRG5MWnNwaGhaVkRVV3BPRUhQaWc3dXpwcEFKcGJOT1Q5SmFUZFhHUGFZ?=
 =?utf-8?B?N0VkMWY0VnVPSk0xVTRUVWwzdmZVUFFNWXdscmFhVndIUGp2aUpTTENjRTl1?=
 =?utf-8?B?MktpaXVQN1NKWEwzaTBmM2ZLMkUyZFRMcDlLL0Z0YlpIMWdmM1dpS2MxMDFE?=
 =?utf-8?B?dUJpb1U4ZDJtdXhYbUVSL0phT2JXeVJWLyt1c1lxK2ppSXZ1UHFJcitNKy8r?=
 =?utf-8?B?Q2hkZUIraHFBVXg4VHlQM0NMS01zYitMS256QlNjN1FZbS95N3lkdWdCajk4?=
 =?utf-8?B?WUtDelNkeTdGOTdPVFlkTkE1NG5nQ0MrUGpBdnNBOXU0SnZkR202SjBwTlI1?=
 =?utf-8?B?US9sSi9ETEFkOUpDNzZoRmxnWTUwK1lza3dlSkgzS0dFWTMwejFmWlRhOWpI?=
 =?utf-8?B?UUR4dk00VlllM0RtOTNseDZIOWU0QjJVa1NlcmpPNmZOZUVjcWQzWjczRzlZ?=
 =?utf-8?B?cVBQOGRWQ0d2VzYyRDhiVlJKaEVGbTJEUW82cVU1M2VDd2Yzdjc1U25mSVk4?=
 =?utf-8?B?VFY5RWN5bG9nNVdPQklCVi80L3FHR3VtaUFDb0g0TUljYXJ2VmQ0N3NUL3Nr?=
 =?utf-8?B?SWV0b0xFTXllem82WFVaSmh6KzRTY0hNWlgzV3NkeEZSM215SmMwRi84ZUhW?=
 =?utf-8?B?SCtzM1hiMDFnL1BSMzBvRHV0c1VrbzVSR015M3VzT1RaR2Njenl4OCtjRUMz?=
 =?utf-8?B?YVNkWUxWWDFZQUNNSC8zdVhPZWd4NFRLM3pPdjdIbU5USHVITnozTnRtMWl2?=
 =?utf-8?B?eGZ4SW52WHZaR0VaYnlyL0kvblB1S2VkQUtIZWxFSUlHLzRwQ2tnNFVZT28x?=
 =?utf-8?B?RFlYcFhzUkhtd3NHMDROSCtIclJXR0JFWDFCTkpScGR0RXdaQjZySFl1bFpU?=
 =?utf-8?B?ZkVzSDluTHF0TlhHZE9UK2V3SkwxSThFZWRnQXBJRTg1SWNUSDNwcExQN2Er?=
 =?utf-8?B?WmFWNm4xdVdFYTcyb3hJZjdRUzNvY3VSRDFHcndvbGIycnFaTE5sL2JObmZR?=
 =?utf-8?B?cm9CcHVJcnNhdnBBRUxPKy85UWNZeC92VnF3MTVHVkdKK0dLYVB3WTdGREQx?=
 =?utf-8?B?Y1F2RDBjTzN6VjdIRnFxVjBQdHMwMUxkVDNLTHdKNkxKa3JEVEVNbStBQkUz?=
 =?utf-8?B?bjNsdWNMR2FESXNOWjNJSmRpQkIrQ3NMbmR0SENTTkRkdW4rQnkvckthR3Bo?=
 =?utf-8?B?K1pXajNwYVFTUjRHZGUvcyt4WWs5alRUOXRzeDB1ck5tMDdJdldkNVdiRE5k?=
 =?utf-8?B?QnhjVkxSQVMrWTBVai9iRnpRbzBJQUo4Y2F6ZndlT01JeHUrSnM4MU44SHNl?=
 =?utf-8?B?L2lzRExxam54ZGNnM0NoMG1YR0FIOS9PR3p0Y2R0RGQ3ZGVyaWNvSVNUL0w5?=
 =?utf-8?B?T1Axcjd2TE5aalBjVDN6dC8rZXRUMWZlTjlLNTdBRFpUSmg5S1hybk9odW02?=
 =?utf-8?B?WmlodWtzNW5kVUhaOWVic0hxd1phaklHeW1iMkZiQjNHdE1uM2hiRVlNQWJH?=
 =?utf-8?B?cDNvNXludU1wWmRIcktMZHpLYlBLaHV6ZDlGVHRWREtJd0ljMlFqbzNjSFpY?=
 =?utf-8?B?aGVhNVBXL0gyZW9PcWZMRnVyYTB3UU1ESG9OSGxkcVVDWVBra2UrTXZESWxU?=
 =?utf-8?B?RW5MY0IwSGJ6bnByQnNqbFpwTWp1d0k1K2tqRkhUcEp3UGYvcXRsSFczRHkx?=
 =?utf-8?B?UnU0M0lSNEw3S3FWaTV0eUlGcFdzRDVCY1BaQjN2YnIxSVJpb0RMOTNLN0pK?=
 =?utf-8?B?WVVWRGJITHJSYVVyU1NJL3FzbHdtRE54UzF4bGtrbzNCcFp6MlVIN3ZMei9N?=
 =?utf-8?B?UlJEQVBIVTZJbHNKalBlS1NTaUplVkxXWGJkSGZPdzgvY041ZU1CVSs3RmMw?=
 =?utf-8?B?ZGpqNVNUL3lFaGdjWXZNSmtDNEJ3U0VleDhtTEJtOFFzOTRvQjQzdmUyQUVa?=
 =?utf-8?B?MkF4NE51aUZ0NzJkNjNOTytTTGpnbzIzekRSaHJxQmIrOExXMW43a21OaU9Z?=
 =?utf-8?B?anJydnNSTDZBL2hjQmlhWWlXeUJJM2RRZnEzQlBweVFRaXVjYmRnaElpeThR?=
 =?utf-8?B?Vld5ckNrODNZaTNuZGQ2bEhwOFFkOC8vbDVlU1pmUDFXRXFnN2dneHUyUzhO?=
 =?utf-8?B?M3NyYzZ0cTJlVUlRemw3R1BKYk1sTUpKNUdZWGM0TldFeHJ2Z05iQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3025e7a5-a337-4a6c-1871-08def8fbca0a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 05:29:04.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbgm8nyonBncZbwGvWlREZ1JLPq6EGs4IodivWMwi57anr9tXG0Bu2nPeKM7X7lhUNtNowZThn1VfJbyUc+aJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10029

On 8/12/26 18:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The patch adds `depends on QCOM_SMEM` to `QCOM_UBWC_CONFIG` but misses that `VIDEO_QCOM_IRIS` unconditionally selects it, causing an unmet dependency warning and leaving the original linker error unfixed.
> - [High] The conditional select in `DRM_MSM` creates a configuration where a built-in driver calls a function from a module, resulting in a linker error.

these two are addressed in patches 2/3 and 3/3.

