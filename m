Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B20397E8A;
	Wed, 12 Aug 2026 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542344; cv=fail; b=EgOZCSjIyWFYQw+iHEmOD+EjGGrxY2ANhNYR8aXKLj1QgWkpq1zptbt3gmemPvKYSb8Yfq4a0aTNQQjrOT+h3oo1yqto30cSjzyN3aZyW6pFDNfA5uUaRG+ooefg+1ao5jeZAVI3IDVUnp2rE8dmdF4oIbLr7SATnTspbG+BLS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542344; c=relaxed/simple;
	bh=q3eU8mt0vsqdtBA+L8Uq1isXXZ0tM5DfyGL3hXRNrik=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uJHjNJ/W5+i4Q8Le3O0qRMtvKGOZYTUhv9YhGQZi/8sygCxdXXCY7UXcbMCJa/ZEaplgBJNK5ZMT1EedjUuYsw3ygmJ2NSwxJ6EE3nBvyqJZ2PH/eG0V2a95laDz1b2WTk7HJF01vzkgOtTrDVyHuzv1J/qjL86y9in5VdTGoCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pJ1U6Dfq; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pJ1U6Dfq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhXIJGiCOUCoBnB4zMAPegQCTytVXE/A+wcvA4EHdr8AKcrn2voX32tT13b9S0Br8pimRnsuiCxyWBiT2X3BrdtyCSoD7l/bN7yoW9WYfZblvWa246tQT+bL0Hr2fGBi8Uu5r3sHwMLp0enlWD1yQT+y20RUdxeFkznanCqIvN6NgzXPQNvKmO+Cz5L1oLUG9pCUHU1Bg/8j5CKO4tvF+zQJ7qhUArbPMhPGkXKd7FLtiQwCfQ1Hcdovf+uBSY3xJsit/M37A8RNI0zOl2St+r7K3gmjwhRm8ToH/NfvvpPXbhzlxQ+Rf/DEGxtJAqQQGkrpSlzsZ+Ds0CTlUwLYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfezVu4qGaRRPApNkayzTf3EtC12wJ2VemVEJ9Ijyj4=;
 b=DN5k4ufQEN9vtHaRlvc9ScJTGLEHUSo1DN32Gg0uYpZWfw7enlGqH+nsnKtsM9mSe4uyqrvcpxw/B3ovcz0wOGDkRNzYaOAVIazhUG5hjxCePkA1uwMfJAP49hViCWn0xccYmkvf/nar8lQ2qRD1DkGABGhpC3qrMtdmRtO9BxxaOJoMcn7gYnDHiHIbk2eHvgGVdsBkHsaqIgl7eyk6GXikMX64s36YG/qROfKDihmOmABWRFahS6qgUjzebmafxODoMlQkS1ZDnqltQxphwdjMybVEbKf9fHklgu/cHBccjAyvQ8teFdoXF7NN9OCkmKH98kj8E/XH3UAoBlWSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfezVu4qGaRRPApNkayzTf3EtC12wJ2VemVEJ9Ijyj4=;
 b=pJ1U6DfqGDqUyP8LPSR4PFVOmHf2doKlfWe5D2/ly5W2+u7oPhIPIR2b6Inhf53+8AgF1xyqwkxyv3GNdWEkkVKGbN5pj4udO5YSDYvU6mo74DIxc/A0G8epV5jDlB+xlG+0vclc1FNMd0MvB76wSDcsUaWueeOHk+vfbNim04OCFp3HvH6Z1SudcJVt7z5rl/Mg8jEmpYXr5Hsh5EtPlxKIqnM4ymskfxXVfzsBRpbAFXs0uoxR8PijOjc4NSjtFld4ZGnm4fOus94v2hP0tMIaePy5Az2BgcBfECUuYY3jVKixVy9tpkmGhAX4G3xUrC/51a3PwINoAo5VHZQK+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by MRWPR04MB12332.eurprd04.prod.outlook.com (2603:10a6:501:85::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 13:45:39 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 13:45:39 +0000
Message-ID: <da9a3b50-bee9-4485-aeaa-5872f09c499d@oss.nxp.com>
Date: Wed, 12 Aug 2026 16:49:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
To: Bui Duc Phuc <phucduc.bui@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
 <20260812101418.37966-3-phucduc.bui@gmail.com>
 <20260812102938.D4E101F00A3A@smtp.kernel.org>
 <CAABR9nEzo9pb=mLhZ2nyDuSYr=qDcgBZDzMUqptyvDCG8nLgTg@mail.gmail.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <CAABR9nEzo9pb=mLhZ2nyDuSYr=qDcgBZDzMUqptyvDCG8nLgTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::11) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|MRWPR04MB12332:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3eaf58-3874-4415-15c5-08def877fe6b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	hodIHCi3fMubdbKd2upDjcdlgrlIkCi3PRPzc28e937G2DRmHqGXpE5BxrU6PDj4mt7LoVme/neaJej5UG3ciB8ieRD0fhCmmF0S+fuzP8BpznG9+r24z0SeuIHol3bX98XA1sDqYBATu6aw/hqRQ+OWDuuBZq3wnWKgrwjGbFaUoKQYqc2/4pD2gHibHG5xl7nie/C44wqOyXVfnwLTkule1L2A6Co1QiwmsIRymI3Vj9Z6KoVWiIrHGYNo1rDeT7OUqy5OOrhNJsIUsJdCShz/9Y3SVyi+QJB+XOqJ7rfppTyeHLoV4A1/L/rA+4CB0tXsCrHqHBfoP0m9hngVGolAmxyTzGpQ9Zps+dloHf0oPpCSemJHWTIAqzFgASmPfI2xHjGt+o81fgT6TNkcVBOR2XO3wqIsR2dGqOhwGIfjef+Lu6HUg9X8ezgpp+h+neM3xCQTGzgBs2uLXactkv62hqdHoQMDRZ+QzT8jLU0casWbmhbuNYgF1ObbGDQrysw6okFiA9JfIlvuatVR5jE5GeaFAU10pUaJb2DIxskhyFUPYe/nHT8NKsG+0EBTHsxjOy0Z3+weyeaE5RiEOJG7rJYUiZiv0lvp5XFWG+daztPNLdfZmLyltOTlIzuJKFCXfqNwWJCLcZguIzG30w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFg2OS9md0dQTFk3Z1FRd0hWaVJtQVEvZ3JHb3czcHIvMnZhRytmdjRpNzRQ?=
 =?utf-8?B?WXgwRUY4eFhtWDJER0xZdGgzUkIwOCttc28wUlQ5OThvWXRUVkJFNitiZjJt?=
 =?utf-8?B?d2VFN3k0VjFESk1lRXM5QmNCZ3hDR1E2WWVIUUtTM1d3eG9FbFZaSmpFa3lZ?=
 =?utf-8?B?S2ozTys0QkEzR3YvdnY4N2R3QzJZYlZWTFNoK24rL0NxRjlqKytPbGNVc3Jx?=
 =?utf-8?B?ZlhzTm1VUGR0Yjdid1oyRjJRWnp0LzJITDhhR0hjbExObWlGOVJzeThpcWxR?=
 =?utf-8?B?S3hOcS9Md1ZraDlWd3R1dncvdStuUFdOa3hFVzNKcUx2RVEwZVJJVlpKYXdE?=
 =?utf-8?B?aVhqZlB1MzA1cFNQcUhVd3VrS3M3VnB4WXBSRTVBclV4Z3pKa3hpS0x5b2Ru?=
 =?utf-8?B?S2VsSXpvQTVxOGdtaE5OYllrTkt4eE9GaExkMHMvY0FOZkljT2tsR2hsdHVK?=
 =?utf-8?B?N2hFcFFBRWc3N3lUSjRqb1BNVm84NVVUMmQwQWRTM1EwdWdEWW9EKzhzS0JO?=
 =?utf-8?B?WjhjQ01FaDR1bGZFWkRDY0tqaTJMVFhBQkNHV1JUTnlkYmROd3o5TDB4M1Jv?=
 =?utf-8?B?N081UmVTcE5zZ1BTOTFmVU9IQS9iZzY5cFBvOG9rRG1DaDlXdTllNGt1ZGtq?=
 =?utf-8?B?a1dVLzdrUUgzR0Y1S3hkc0xMQTlmdlNyTHdkSVhFcDJaUWVIOXF4L0lhbks1?=
 =?utf-8?B?c29zR3Nrc3FidmRReDZiMGJDcCtUaUZXK0p6VTgxZER0VXRRbWxsbXE0SXJv?=
 =?utf-8?B?MlV1eE80YlU1Nmw0cEZ0djhQVTZ4VmJTNFpjVkIrNU13ek51Uk5hRjZlaWpN?=
 =?utf-8?B?b0o1T1BhZ2JsLzI2TGsrNnBDR1VTNW95Q2loc3AzYzZHdGNJeXYremRjblA0?=
 =?utf-8?B?ZUJMRlJGb2MvS1Y2MXpBSnZ6MGlMYjF1VnZ3eUVqUUJKaEdPTGl6VFkwWDdo?=
 =?utf-8?B?TUZZRWFSc29aaHBqWUpKS3Zsc1dEbTcweVpHUnVsakYydk93S2FVMlZ0OEY3?=
 =?utf-8?B?aERRcHBLTnFZZHVRSWg3bElteHFybWlPaEEvdWd6UnlwbnhYcmZUR2hoejJH?=
 =?utf-8?B?TW1hS21mcUd3YW1TVVJSRlNMN2RNMmVwNWNUK1BqS1JCUjZtUGhVQWUvQ3dJ?=
 =?utf-8?B?bTF3ZDVHd3p1SzNXMVJpd3lKRUNtTTNsclNSaEpQZld0Q202WUVuNnpVcEZa?=
 =?utf-8?B?MkdMMFhQQkxJWXBZUElsOE9ONHNCU09uQlp3bjNSQTh1SFU0am1RUWJMQS9B?=
 =?utf-8?B?eFdiY1NzcmkyUStrcjNYRklGdDNkWENENFQ0eko2dlhydUZtaHpWTnZRVU15?=
 =?utf-8?B?Mnp6blMrZUJ4TXpjc3FuNEEzMFRqM1pSOVk5NjVucEp1cWVneEZIc2R0Mjdh?=
 =?utf-8?B?QzcrZHFXdndxRXM1dDR6cE8ydGVDOEpGaEhPeVlKV3pCNmpVZ0hCSUZ1bjc3?=
 =?utf-8?B?VzBzNTd2UWJtVU1KVzJFaXdkL2hKNHkzWHMvQVpEWFJiaXZqUk54eEJDUWFS?=
 =?utf-8?B?SXRueENKNllrYVhTZlhsMlNPemNETmx2L0NoYkhXL3N4SmJ5K0xBcWFNU1BP?=
 =?utf-8?B?VmU0cnJTWEc5cGxHL2NTbk5PUzdiMFI0NWs1WTNINGo3OGs5YWFwNi9LaWt1?=
 =?utf-8?B?VGIvRG1DczltL05tVFRnWGo3M2loMGNpNEZLcUZOWW1sYkcrbktJR0QrbSs0?=
 =?utf-8?B?VFpHNmJKUnZGSmVCb00wSWorTXhGYWc2dWQ2d0ppN096NzF3bDZZN1gyWXF1?=
 =?utf-8?B?eXJ6NzJLcWpNSnpTY0Z1TjYyMWZpTUJGSXlCQ2FnWlFJUk1Ca2JMNFNoa0pK?=
 =?utf-8?B?WS9mWXFEVGJPdUVSeXZXTFlhVUwrV2NwaGtIbVR0WGJnMDgxYlAvbXNXWVcr?=
 =?utf-8?B?THRDN1krM2g2V3NPemltUlFNaVIyNlM2Ukx3cmJlZ1BjeHV6a3BjbkozTlR4?=
 =?utf-8?B?OHlJenlwUXlZTVZnOFVqUkwwYzVFbmt4Y3NaU2ozSGx5bldaVzBYVTNWZUdk?=
 =?utf-8?B?dDlDczdLaGFVMC9NbEhIUFZPNmRncURWQ1JCWU05L1Z2bGIvUVh2MU0vRGhR?=
 =?utf-8?B?aXk0bGhydzdGVFNld3I1LzdqdEcvaWg5M24rVVpRWG9SVWthRzJNcVdzbmdI?=
 =?utf-8?B?eStwV01uSUtYNlczc0FhYkpRdlREQWJDRU5VcUFBQ0lGQ0J4RGp3NVRlM2ZQ?=
 =?utf-8?B?YUZtQlR1a3dGcTRSMDdXZXNZaHQ5aDd6S2JnTXNmckxSaWszQmtSWWlia3g4?=
 =?utf-8?B?TzlTTU85bjZrQVcvQmp1K2tjUERYODFvY3RGcTk1U2JoZTBHMlpkbTNUZUtE?=
 =?utf-8?B?T0NMSURMOVpoZ05oLzV1Rk1tTXRmZm5ORk9DclFSUXJ1cXgrUkNTdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3eaf58-3874-4415-15c5-08def877fe6b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:45:38.9348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KsM4o2zyiJLjYjvJCs5zUrR4+sbKajbglc178zUhMIICZdu2cVv3Z4XnpkhsDFxSFAM9zlymzYL4toMitU61A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12332

On 8/12/26 14:28, Bui Duc Phuc wrote:
>> [Severity: Low]
>> Are we sure the underlying functions actually log these errors?
>>
>> Looking at devm_request_irq(), devm_snd_soc_register_component(), and
>> mxs_pcm_platform_register(), they do not appear to print error messages when
>> they fail, except in very specific edge cases.
>>
>> While the driver core will log a generic failure code on probe exit, does
>> removing these specific error logs cause the driver to fail silently at these
>> initialization steps, making it difficult to debug which step failed?
>>
> 
> I checked all error paths in the called functions, and they already
> report the corresponding errors,
> either directly or deeper in the call chain.
> Therefore, removing the additional dev_err() calls does not make these
> failures silent.

Point here is not really that the error is not propagated up in the call chain
but more like if you remove the error messages the user wont' really know exactly
where the failure happened.

Is there a tool that told you to fix these? How did you reached the conclusion that
this patch is needed.


thanks,
Daniel.
