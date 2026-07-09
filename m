Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022126.outbound.protection.outlook.com [52.101.126.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C2D3ED3CC
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 09:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589514; cv=fail; b=qwDhGcEs7ZuA/KYv36azxGJTrM2+sRXJuDlYCkr4EBqwdHKLLXP+WVQWX8O7+rlOiDearRFiBYGI4Ep4gx6e/u1rjYFYP/xQHeVdmbMJ7II8h6//GwoxD8GsMo1IqOvIEUaEy7BE2Bz9eRGPYs6gSk5+I8nNH2M19nX9vCp4O6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589514; c=relaxed/simple;
	bh=u2NG6IQ136bOM+VwDXPW7iVjV0R5qijvbGIJ0PBsnIs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QYE7jBrCVNW/uoVbQq7fJZE8BMWfMKZpCSBhDUyyoe++FTpQWuS0sVyBoA6YJRMWeeUb9U5mCTOwFTqwcCZFEkACN54WZeVIsqOdWxbBUzx44lJNHxxFxXVNC/6rkFJQnw+RzlB4231PssGGm9olV7TYNPeRWDxYayRxnpjlOwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=LS2vm7Ci; arc=fail smtp.client-ip=52.101.126.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="LS2vm7Ci"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOFTBbL7P8743tyrg5151FzXSh3vWiXkAUR04xfj0bf0f2QoTyzZJl8Eq+6q9Wy+Y2UkLGjlMklguiy/9qqLpVHighqyMqrNts+qlLQoFAw3ilbspVG0MjcOKjrEpf4d52UcKqV8fcxUXD2RU7Jp0uI4YdfDeLwLt2F6/h+ODfDnow6F9dYdKzqL3Cc4jdv1Gt8/P7A3i2Gyp6C8jaWUAh2JXfF5mn6e1Bivshvorw8ZsiEUtjzX/tfRBHarGMYtaOYZBn37S8DAGy8l81sL+7hldqkVIalWpPL2CuH4QzafggKYows0DF5m6yycJuKbPEAvfnjI4AvCbkGOHxsuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69OnSVdVbyAqzMDBu5Yi3FjqYcjADWW+GYhB6uVtDo0=;
 b=sOL2TqVP1U6jlUCS271jJGBlrwjDK8FQ5ypk+ycnn8CFQOln31YB8fCHabp3n1gdXNZ6EDST4SzHRWXe84htEISuiCWMqyE6P0MeWJkZ/Os+2AYgJ4sjSnzUIbFqNJzcgSnPZpcBhGbgRlOV4meWY8Cbs0I+bqNbn4zKY6QPf76tpfUILi2uR4nTNWapmuNW2WhZW9kfWHsKy5ujmeWzLs6MhcT7R8OBw9+HtS6Z6pee0Xy/GkmRUOLdmVX7vugR3BMkqwYPzFYYAKjDn8QDIp+ZlpUvc7G/gJtI3x//NzU9Lkwh5Zs4oaNDkUhejgv/uTzqU5SBd3cBp0IY9HGyWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69OnSVdVbyAqzMDBu5Yi3FjqYcjADWW+GYhB6uVtDo0=;
 b=LS2vm7CiGapkWMz2zWl7519MplYjRA53ei1Vh7x7/ognFA5DYjr+zqcKgfmI6qAdSgNKzUZ6HVn1uV3i4+2qblk7Qy9vSlmEP0dzgGroTI440TS+IaldY2zf6LkZUQ7gn1i1y/LAu4VWkYEOli+MUzIQk/hIiZpeVEHMbKR6VZX794H7VSOi0Bwl5OnVKdNGMVmW6pUizxe7GJcGQy7hry3ZRTL+ysZiC9YTrK52aes4gogy1FzL+ZT99atCY5HQpLwMc6NHHvXi1Q3/xt/NFj1tXowRJ5z6hDIZ75zTej3koVEx2zVjAotfxfUMOGNyThfNlKVCUgb+WlZMUYs9/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB10185.apcprd03.prod.outlook.com (2603:1096:101:33d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 09:31:48 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 09:31:47 +0000
Message-ID: <ee06a6db-1f58-4bea-9933-598322f7671a@amlogic.com>
Date: Thu, 9 Jul 2026 17:31:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a9: Add reset controller support
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, neil.armstrong@linaro.org
References: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
 <20260709-a9-reset-v1-3-fd7cf039b853@amlogic.com>
 <20260709083550.403D61F000E9@smtp.kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260709083550.403D61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0045.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::6)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB10185:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caff30d-9850-46f3-b4a6-08dedd9ce5aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+o1QYsSg8l3VYyLLmguyFpG9kAuWVzXtpv88nGQuUNrN9OLWHW2/dY5ytu+dqDE5i+e1fkbgtuXdVKnYg38pueveB6fsDtaRna21aQNMNu0RqpUWsSKbQ416YxXf3d5CQsL2+m1BCpbeF/gIlmuIeUrqKnEHumPIpH8qEnUfq4C5KDCp3Bn36JgqehdO2qJFUuNJyuyTdz10TtlxlVggYMDN9exFuZ6IGihS/dRKSxQRaY2JH8LdgjPeQ8V4aHD7+QRK842iQa3SHgoCCmgpJQTVBCWHmljBGzpIomZexO72uGYH26gF4Z767gg1IcA3xH1PpAQTV9SbYcdBaOLfMXMUwB+PvZqISkvEaYBIO9yovoVowo1jAluiZy7TJQ6v58tkj84qbBFo+6iWib9y/C2mjPFdERx1lgutPTCJCy+7YPgl3q5PdDS8F/Rh4oWFJ8QK7fylyG2RkR8p2D5sECGainJNGXxxAK5yBvY8jEcINCyrYgQ3+PRbXcxXbhXeWn7feyO/xcJrn2XqC0CKm3sB+Bt8vsYouYu1pzWQzO34CSrKUnFXeVP4VpS/cQh6/8Y6YvoyEbZkvU8omZRKlPB8xMVQV5GTlKMieVzeXqCNNNSZtTIyd5/XUYGI5I+kIUgF/XD+aQR/JMMACdJV0i8XYqq6G3SPJXH4NB8YVo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlKNFJ6RDhxbVkveFdpOERLcGdZcHpwUjdTUUxzbDNNbFp0YUJ1WHJqcnh4?=
 =?utf-8?B?Zzh6MVFERTZXbmxUODlnclhtQ2JJYmJWQmpmUjgvNTN2N2s0YzRYZEM0UWJV?=
 =?utf-8?B?cGJQcERmSDlTWUE4VlhGWjFtMExVbWxUbzBVMkRqdUJ2ZGFGRjdrUmNVVDR0?=
 =?utf-8?B?ZXcwcktyZGZRWEhmL2l6c3ptYWc0aXFqTWVyYTlmZHBNQklMd2VzMzd4R0hI?=
 =?utf-8?B?VWNKYktJRjl6ZHAvK3doTDREVE9XaWVaYUpjUFNSeHNYQkVab1BtVndCeHpI?=
 =?utf-8?B?czVnSThCMDc5elEyNGdjT0lVVDdZQzl3bkh3VEFjRGc1cklLUlIwdEFrMnFh?=
 =?utf-8?B?bUNSSjRDMVI3bnVFR1FpRlVVVW1nVVlWRit2c005bms1cWZvUVpqbGNESnBM?=
 =?utf-8?B?ZVlPOE1IN284TFM4Tk1kWTF3RnRjYlMyK212NEtndWwvc2VXZW9kUWYzUjJn?=
 =?utf-8?B?N3lDOWhNbEp4OTNRUkNSUkR3bEp2UjZKbHlVdGw1NWEvZWJYK3NJaDVxNkYx?=
 =?utf-8?B?cjN4ektWcjFpRXIydlZyNUIxWEVuMG03USs2R3p0MHUweDhQd0lDVXJTT2pt?=
 =?utf-8?B?Z29RRmFwVWdxTVdDQXJXYng5dno4ZitFeU9nMmJsT2RmV1NrMnk2WlJMQWVi?=
 =?utf-8?B?dXhDUEZxMS96YTRZUDhtZkZMQm9TcGJPYm9OZWFHU0lDbE54MmtIektkZVQ3?=
 =?utf-8?B?MEh0a0dQbTFvL2hXL1c4L0Y0SnRJZ2Q4OWhxcnZ1WXJVcktnRTE0MmJ1VzZr?=
 =?utf-8?B?Z01FaWFOK2t1b1krVkFuMkNqdnpxemh2RTlsdFVUaThqZGthbElNckpqckkv?=
 =?utf-8?B?MWY2MXMwQWt4OVliQlNxbjZHNCs4ZHM5MFhteUh3bWpyT1lKclVqZWEyTlN2?=
 =?utf-8?B?RXBncFdrejBtdnJZYjhQQTBvS0VHWnNUbDB4bmlwSVNMd1FzbEtndmgrQW01?=
 =?utf-8?B?eXJpckxMaTF4YlFES2JuYzdHOXRrNmZHMEZlaXNwaWpPZllmK1NRY1pHejdp?=
 =?utf-8?B?S2thMURVcTV6OTlVdXZ2MDQ2a0V2N2h0YnRUUkpSRGduVEh3SGdUejhWOEZl?=
 =?utf-8?B?YkJUcTVaQTg4Q05pbG9MQStwVHh5aHl1VitFRVBkc0JWcllYaE1uU3lZQ25K?=
 =?utf-8?B?Tkc0bmxMNnk1djJkdHJIUklrYXFmVjNCeXdVRGlPdzFrbGZiVFlLVjV3ZTNN?=
 =?utf-8?B?TlNzSjBrNWRYYjROeVRENitYaVFQSWppNG1oaVNoQjNLMWorU0p6VjFMNzNz?=
 =?utf-8?B?c0pCY2RWWFgxRU9RM0NoS1hrVmd2RmlTb1gxTTU0cDAxNytsZmYySTJyUnlC?=
 =?utf-8?B?ZGNMdDEwT3dhNnROSUdRSzh6U1RMS3VWMENOdDNzUkxuMXc3S0M0cGRFMEly?=
 =?utf-8?B?aEJ4T1FHbHpiQ2tqMFoyTmJtZnU3NjJTVkI4emtSUElMLzdwdFZpOTJVc3RE?=
 =?utf-8?B?eDczajhCZWdHQ3IyRnpFR1JlZDgvZnJ3OFRLbXNRUWxNTlA0aVZBc2FRZktD?=
 =?utf-8?B?U1hhdS85T0NMV1hiQ3ArN1FKWHQzZ3d2NURrb0thN3VpaGE4a3M3KzZLTEtv?=
 =?utf-8?B?ajFzWjdHNGM1dGM1UjZGY1ExeFhnSlVDWUFSRXZuNEpLSlhadWF0ZU44TzBa?=
 =?utf-8?B?S1ZkN0x4WGRKSko5aVJuN1hyQ3JaZVdSc2sxZlBVT2pBaWFHaXU2Vlc0a2Iy?=
 =?utf-8?B?TEN1R3kwa3kzM3gxYVBkWkNmM0xjUXhCSWdWOUVuSGtlUGpJbTdWWXpFZEp4?=
 =?utf-8?B?a1lqdUM0WG05TUhEcytJSWxzMHlEdEZQclZDV2VsTWQrSXBVckhVRHQ5WEpa?=
 =?utf-8?B?dVJnNldiL2JvcnEzaW5DdVVPQnhPdlg3KzVpR3NoSlBNd2h1NjcyRUJPeFNM?=
 =?utf-8?B?ajIwWjQ3YXN5N1JZekJkd0hpYnpOdW0rUkNtUFNabXpLL2FGOXgrUHloaG93?=
 =?utf-8?B?NHdmeDV4RGhUQUYzUHUxUkdmZ0UzcnoxRGhGZCs0dVdSTXl0VFZycHVvaERr?=
 =?utf-8?B?OVRYbFdJVEpRY1plY0licERIYmFRUU01V3dUWElLQ2tWaGdxdDYwRzFHbGlp?=
 =?utf-8?B?bGFBamdibjdjWGRoejJidWVnVm1kWS9WcUxOSUJjZ3lSUkhpTkFlWTN3c1lO?=
 =?utf-8?B?TjlNc1cxbDJkYXB3NmZDVzQ0UmdkZXAxYTMzVUcrL0xMaHJaQllnTVJTUURh?=
 =?utf-8?B?aUN6NjhmNzdRTkVwaFlMT2JtNk9jRFhIUzUvd0ZtVXlOZmVpeSs1UFJHd2Jm?=
 =?utf-8?B?U21MUTZMQlRiK3ZyNG1FMTRRdFh3Q1ZzN3JMNytTNUFhVzEya1h4QkZzYmNC?=
 =?utf-8?B?cituTzBLZ000R1RyN043QkpwZjlFY0RYR21jV25mWDJlVGJmcDh4dz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1caff30d-9850-46f3-b4a6-08dedd9ce5aa
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:31:47.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOd1Et2hYfn4tUAaUejNHQT/YVpfmf38JxqHibv4GOkuPeMC5uxK+jl6tbF6pRVzq8b+otp4o44dQbOd7Q8stPqCAXxNOslsbIPEu0ycT6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB10185



On 2026/7/9 16:35, sashiko-bot@kernel.org wrote:
> arm64: dts: amlogic: a9: Add reset controller support
> 
> This commit adds reset controller descriptions for the Amlogic A9 SoC.
> It includes the corresponding reset IDs header and device tree nodes for
> both the main and ao reset controllers.
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> [ ... ]
> 
>> @@ -204,6 +212,12 @@ aobus: bus@ffa00000 {
>>                        #size-cells = <2>;
>>                        ranges = <0x0 0x0 0x0 0xffa00000 0x0 0x100000>;
>>
>> +                     ao_reset: ao-reset-controller@2000 {
> [Severity: Low]
> Could this node use the generic name reset-controller@2000 instead? Standard
> device tree schema validation expects reset controllers to match the generic
> pattern ^reset-controller(@.*)?$. Using ao-reset-controller@2000 will likely
> trigger a validation warning when running make dtbs_check.
> 

will use node-name reset-controller

>> +                             compatible = "amlogic,a9-ao-reset";
>> +                             reg = <0x0 0x2000 0x0 0xc>;
>> +                             #reset-cells = <1>;
>> +                     };
>> +
>>                        aobus_pinctrl: pinctrl@4000 {
>>                                compatible = "amlogic,pinctrl-a9";
>>                                #address-cells = <2>;
