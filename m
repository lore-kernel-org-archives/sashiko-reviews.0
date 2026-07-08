Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7437702A
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511352; cv=fail; b=KfGbrawXl6pMVY8juW5NecW4fKrK0EKOKRWnJmbOZOU4wUfHEzmXNa4v6Eui/JOXQX+I51B1Dd+gfkTAwj0OfmZYUYJGa0ymMGYQkDZO5pZHpBt3JCEs+sdrU4XBZ/Qd/ulF25NXD1fT1LME7WmsHXopqSzaULjBnD4uSz5yJKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511352; c=relaxed/simple;
	bh=okNco3PiWGyqtcCLmO2/LVD3delPj/m4Z7ksFC2uDnQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CdkJrs604PcexRqCQucXfPqDo7K1M0z+E0JHobuPy+ZO2Qi30+Y3ZaGlTRgGAwMEIvEGQc8OuJousfSB28FpyZsx2RPiPEMdX5YgIfv0lahIJtYiqttB/naMcE8i2SJI2DCy35/qe/MYzrNtYQ8G4GqY8LCxxrSqgKMYlyc4/Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rmF7tqhK; arc=fail smtp.client-ip=40.93.196.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rmF7tqhK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNfEQMuYLs5pijmLzAkteGveL8ucEtxOW68yTZIwTsOhWFv88PGA95Jft44H9cpLQKTQNFLk6d+OP32G7uqqRf9SMZpde1HvGZryJsSvRdLmTRlcWqbASH8KY10tzxgZFUIn4pTrdwV55gBxUflm3I79Ygluxoa1pe4e4f2ZtHnYhzlc3SEWlZmXdycRJq8vrn7QBEhRAf+8IGtVrvOk72gk8D5jhn+jIZxOiYpw3bjfbRaDZnn2Cmj1rWjrsQX6Byw9MkWB0g+JDZlvImBxh1CHMi7L978O1mFOwcDvUX+yeeMdSPODgsOpv5bUkpixu4qZAWZWLsbGbWge78U3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMsbUcEZlKxqh1wIioI/yC/vTRLYyUlVVsu/wQvhtSs=;
 b=s4Gx2tGv48YASNRVc3qGKvKt9VSFWgy+MIMpRXgE2vLQp61lDPh7olOO6e8q1BVq4hoRNa5I/65wsyyKs4PXPcwMjiR75dgetMSNw8EnMttyTe44YwV53uuTaRB85l3peiKkbtpJX93ZGDDbuoCYGwikprbYG8CpSbfwspJn5zNXz6c39/vay0AO+ytNyarHIkMFGyvkf9JZWAxIjVJrA10BO/0+kaOCXw3m1NC5Fdq2plMFVs1S7Jylz9OZKBi1N4IDz0t/aRZ0Q+V5uECvwaAe0XpEcnkt0odsPWcXAB9Pvfmq49yV6HQeRnUkPJLc/dGwf3rPjACjtOOZU4sMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMsbUcEZlKxqh1wIioI/yC/vTRLYyUlVVsu/wQvhtSs=;
 b=rmF7tqhKgK3/1F60/O3e4d1cawrrrMeVysXfnBELBeluxPLjnmgKjV8BxZjy+8NksqVEvCN+zFDess6nhttVKbxq6Wy6teR7O+LVvK8+FSnMZJF89sruFxTDFUFKcUxjuQuQi7+TMHDpA9bujtk5udJDfS8VNalWMs6O2sAW9Mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH7PR12MB5928.namprd12.prod.outlook.com (2603:10b6:510:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:49:07 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 11:49:07 +0000
Message-ID: <9201b249-e6e2-43f1-b4db-f10f874b74b0@amd.com>
Date: Wed, 8 Jul 2026 13:49:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <cover.1783495122.git.michal.simek@amd.com>
 <f6fc3f65475888cd5726e3f2795a110e9f7a79c3.1783495122.git.michal.simek@amd.com>
 <20260708073722.F029C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260708073722.F029C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH7PR12MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed9a75c-ac6a-4a02-46c7-08dedce6eaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|56012099006|3023799007|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	MeslTDNFN8kn+o/PxpcUiOz5+X14rAKVmxiWx5XWQODePcXeLnCFvwyKdcZ2oD8rMgZJVbf2RGSS3i095iyTjq/+o6MJUE0iqnQGErEQe6pNDMM91kf6msLIrZAtuA5XZsgnKcpRkrT3eKfOqE+97jM+Di2+IgAyRybri9XJaW5e+5NR2bqrD3xvpv9dlX3UmWwUuHwoDE86QwsIHatNhehsxstBART6TWkYf/Mwn971l4ANkNZN3IAxYuTDadneGBmXqf3MYobMllDHmJ8EvMGAiSERTMlvXnlF+jj47zsHkHwEIPB9emRarUvqTv9dWlFxtEYQafSw2glTlPLlAJOI3XBE5V7Z4zUmQEiSkMlPUtRoUB5gnTnwFotKnmYsmAO3ewEcpnPyx8rV+U+cUwKRKc4FWVDeIgdYewPNIq2cifx3t+GH9UOajuHCXh2vOfAGH0NkddH7MGU8rrOJfSKa0ajX1uunuivgwZGPCZCfz+iR2NxLmF5nv24mgncgKIfB7nOG1N04LOxeErf0Usv6xPqn4LEeUuu5VABKgX33qBuxdrFFxClCePa1xtjq7QCj/Mvtx3vVcixHl8BZGvHf2kvu2YvGTWhMh4tlxZvLb/RELrWeHq4kAmrDXwIhpvzTiK1CP29XEqf8DH3MWo7dAdzztSjbVXICWwMw8UM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNKd3RTMERCZVRsd05tY1BZSEd0eWJ4dTdoVWptTmV3a3JnV2NXTEkwZnA2?=
 =?utf-8?B?Z1BSN2gzZjJrZHBib3IwbkxuWjV1b0NoT2Z1STNsRUlBRnhrVlNVY24wOW1T?=
 =?utf-8?B?TEh3Z0wrQlpjVkdmK3B0WG9BZWRFTEhDeENvMmMwZzNwN1ozZzhneFFTbW9l?=
 =?utf-8?B?cURVVzhsU3dIQzF6T0dmME9WNFdzeXBjZ1dnajAxR0ZxRzh3YzZyWm1EVlpQ?=
 =?utf-8?B?U2s1aDIwWVRoZDhJdEdWK0R1YnowYnFJbDBmWnFQRnRNWkdGQ3FBRlJScldq?=
 =?utf-8?B?MW1EWnZ2SHVLOE1sTmN5V1M1R25pMG5rQzB6MXRvOXhQWUFROGVrVkhwY0FW?=
 =?utf-8?B?cnd5WUZwaFlxeVhYZ2llMDBGMGk5alE0elp3Q280MldUSVBtUG4wNHZRcTNL?=
 =?utf-8?B?Tjk3ZTYyZlE4SC9sV1Y4QTlkc2FxMHFOUnFhRnQxZmJIYldTdmQ0R3VySnk2?=
 =?utf-8?B?bFpYTVFFMU8rR3NPR3hFM1dCVU1UbDJOTXZCTksrWWFiYUV1N2JNNTNGVFF4?=
 =?utf-8?B?RmR3TFN2Rmx1Wk9MOVpzdFNjOTdHYng1dXB5cUdWN2hRR2hXbzc2NzBlOVAw?=
 =?utf-8?B?VVhrU1FDU3F1U0NtZ0x3OVZOYTRqMU56cFd2S0VUSkNLZE5jbmdRSmc2OEMz?=
 =?utf-8?B?VDB0ZENkUmdnazZObXlCa0s1Y2lEZkpDWlpFVFc3dGFWTFdpU3NyMDFCOTVl?=
 =?utf-8?B?Y2xaMkwwRnN1YjYrYlRtVkhiQlVQeGNybjVjcmM0a0ZOdnlGVWhZMUNnQW5s?=
 =?utf-8?B?bGRYUWlnMWk1biszM3ZsU3VOOUx4SW5wZHcxSTByazBKRXArLy9qT3A5eXJ4?=
 =?utf-8?B?S0p2bVY5YzhTNlVnZUdxc1NsUlpUd0ZpcGV0elkwUUMrWVhWV0JDZHlTWi9r?=
 =?utf-8?B?djFhWnN4TTVtQkM2V3BIZ0UyYitDVXRlUk5hOWMrV0Z3MEtvVFZBcGg4UFRh?=
 =?utf-8?B?MmFNYk9OOGF6SXRBU0ZHWjF0RjRoSEo1VDljVmpTS2o3Z1dnMTF4dWRoWVBY?=
 =?utf-8?B?Y1pWdkVTRkVTMVZNNnN2NTJrZ2dVR2U2ZUh0ZGI5OFc4VEQ0bkRVTVJUcFRv?=
 =?utf-8?B?clYvUUU1OUFBOTZhcXFhN1BTd0pETDd4cUxHVS9wcWJwNHVBR1o5eGlkK0w2?=
 =?utf-8?B?anZEK1c3VTZqZWVzY1M2L1lFNjZSVlRld0M5aElHZzlZdVdIQUE4Y3o5ekRN?=
 =?utf-8?B?RmRFMmNPUVBVMzNiZ0wxeVZOYmxpWTRNSTM3VjVvNlBYM00zN20xd2FpT1Uz?=
 =?utf-8?B?eHFzdnk3bEhLZkRBVHhjekVMT2pBcFVUTXpSRFFIcDVuRDFGNk9hMVZjSWJh?=
 =?utf-8?B?T2UzQ3RmbXAxaUJQL1k4VEQ5WUZTc1ZLQVR1VEc5aTErb2EwdTZweTZNOURp?=
 =?utf-8?B?ZTk0MHgveUlVUm5qTGw3NGlqNVFrTzFCUG9iTTRmUDRZeEZ5SUNYbTNzTk5X?=
 =?utf-8?B?M0RWMngwS3M1ZE5NSExkTlpWNXBHSWtlNFlLQ2poY1NBUXB3K1BHM2oyUGQz?=
 =?utf-8?B?MkFzRlZEOFFHNVgxL3ErWWpmZlFHR0RoUzVieFIvMW5SOWYwUkhheVZnallv?=
 =?utf-8?B?M2YvUFR5MnloWHBjWno3UzgzY0FUQ1JTbHV5Zk54Q0RtdlhMb3ZtZTBrZ09T?=
 =?utf-8?B?UitQU3NpekY0RmRZWitmeGpCSDV3RTlFbEFXSkUwNXRnd3plcTMwRG9SNkpE?=
 =?utf-8?B?UG42dk01dE1odklST1VIbzIzTnRzalR5aytaRlFUZGIraVY3TXcwZkxrdWMw?=
 =?utf-8?B?TnpPMzl2SU9aNUN1Y2piT3BVZGgzd2FHVVgreFZqM2NHWk1qczRDVVRSSTJX?=
 =?utf-8?B?cWNoT1diOXRJanExZzREZjRqQUVGQ0UyeGdhMGZrZ2lNMENNK1gyWkRINUUx?=
 =?utf-8?B?T2YxclRNV1FXaHVmcU9Yd21Id3ZEZ0FoOUNzekNKa21jcHZoR2I4cTIrdTBF?=
 =?utf-8?B?YTBiaVh1NnFQNUNUVlJMc01iVndTSGF6SnlacW9pL0tYL1pkRnBOTXB1SS9t?=
 =?utf-8?B?KzdNT29VWlZTSlVGbHErNExvTG1rbW1tek5PbGtSN2gwMnNpaFNHdHl5NHZW?=
 =?utf-8?B?aWl2cWRES2FSR2xEVEE0eVRMR0U0M0N5c3k1NUNRbVVvcUp6NDg1S2pPOG95?=
 =?utf-8?B?ditsRXF1c29LcXhEaDRTcnhJL3pxSjFnMFE0RXAvN0RSd2tPSEhKVWF6Ujhq?=
 =?utf-8?B?WStnQ0pNMHEvZ29Tc1paaXN1ODdSamZLYWtva3pmeTFzeWJCdUhaeDB0dE9M?=
 =?utf-8?B?ZWx3VHY5VERWWHRQSkdhdVRpSHBWcVZZcG9LTFVQMFdIZzl5OTRpOXRXdWQv?=
 =?utf-8?B?c3lPcHJsakNsN0ZjVC9VSEZiS0dCY3pKWDZTbEgwRzZTemZXbm8rdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed9a75c-ac6a-4a02-46c7-08dedce6eaea
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:49:07.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yv96B/UhkjBOi0qlVpCBb1O3NPZaCGlKkqOonVUFTgPBTfLYfn0tctLZ5Lkclqb3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5928



On 7/8/26 09:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The regex pattern for `mio_clk` in `clock-names` contains a logic error that fails to correctly constrain the index to 00-77.
> - [Low] The example in `xlnx,versal-clk.yaml` fails schema validation because it wraps a `versal-clk` clock controller in a `zynqmp-firmware` node.
> --
> 
> --- Patch [3]: [PATCH v4 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema ---
> commit 718990212b2e54a25ccb16a23d741b1b1a896e2d
> Author: Michal Simek <michal.simek@amd.com>
> 
> dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
> 
> The ZynqMP clock controller binding shares only #clock-cells with the
> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
> Also remove "(Optional clock)" from clock description because it is visible
> from schema itself.
> 
>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> index b1623c2ab0f69..12d060c39bfc4 100644
>> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
>> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> [ ... ]
>>   examples:
>>     - |
>>       firmware {
>>         zynqmp_firmware: zynqmp-firmware {
>>           compatible = "xlnx,zynqmp-firmware";
>>           method = "smc";
>>           versal_clk: clock-controller {
>>             #clock-cells = <1>;
>>             compatible = "xlnx,versal-clk";
> 
> [Severity: Low]
> Will this example now fail make dt_binding_check validation?
> 
> Because xlnx,zynqmp-firmware.yaml is modified in this patch to add an allOf
> rule requiring the clock-controller child of zynqmp-firmware to use
> compatible = "xlnx,zynqmp-clk", this xlnx,versal-clk node inside a
> zynqmp-firmware example seems like it will trigger a schema validation error.
> 

that fix is in 4/5. I will move it to 3/5.

>>             clocks = <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>;
>>             clock-names = "pss_ref_clk", "video_clk", "pss_alt_ref_clk";
>>           };
>>         };
>>       };
> [ ... ]
>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
>> new file mode 100644
>> index 0000000000000..c64550471581c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
> [ ... ]
>> +  clock-names:
>> +    minItems: 5
>> +    items:
>> +      - const: pss_ref_clk
>> +      - const: video_clk
>> +      - const: pss_alt_ref_clk
>> +      - const: aux_ref_clk
>> +      - const: gt_crx_ref_clk
>> +      - pattern: "^mio_clk([0-6][0-9]|7[0-7])+.*$"
> 
> [Severity: Medium]
> Does this pattern correctly constrain the clock index to 00-77?
> 
> By combining the + quantifier with .*, this regex allows strings like
> "mio_clk100" to validate, since the "10" matches the capturing group and the
> remaining "0" matches ".*". Could this be corrected to avoid permitting out of
> bounds values?

That's correct but that's just fix in 2/5 where +.* was there before too.
It means yes it is possible that user will pass mio_clk100 and it won't be 
noticed. But I don't have any reference that anybody is really using it and
I don't want to break them.

Thanks,
Michal
