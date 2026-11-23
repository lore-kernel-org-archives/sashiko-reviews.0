Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795464937;
	b=gruOE9UJGLMnWERfikk6i1ii//Q/gpqnzekhvOa2pZ/Oxgvm3jyZSE2nH7Ll+ffFc7c4
	 3uoFViB6YaWJZ9ZtGla32KMVe8KU8Hx0RHFi0dUE/c6SG0LNb1Pe2Jv1F8YTw6DcCLp+f
	 KW/ldQ6WR1eoyR8wpFl/USJRw7OlT0bsDaViZ3s+oRVJfJgQ724AqKz/ZWbY10FuRp+XO
	 dTetjyLg2uSmlhHG6qZ8Bi/K1rXtWlNQnidFhQZ42g4y1iM4zK8/cGiYrA2nvhkcBcHLs
	 kVwOpaXsdMpXvOu15y+5/J5qgDg2+TJkTBawtM040TyZCU3v9cB2b7Iu970t+dgY95A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464937;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=Z82dUvqWgEBNMGJDLiDHdf2UMbdFsavJUIvq4KTBgZ4=;
	b=YYOInA1zAVpKayTWK5zmUfmiWTT/FgIIrqhS37M7NqSj0cFX+BpJSsBXxK19XaKrV8A+
	 /E3hYtFPigmfnyGyAUTN+qcRJllvx+1zGoDF5e8ORpu4qS4Q2F4BOH4YUt98N1TTXRa1b
	 GSBjIUXRc45KQGdXQF61sJfjxHxlrdAX5P+gRxjzQWOKTjJiBqT+OJjv1I5nb//cxaoV6
	 H7UgHzjiHQHggGJpwJ5PrcuytRXqD010l/FUNlEsmXNkrDvgcD3YEUtUvh3/ADjNrCKxh
	 fDzsGAfrQ0Nh5DiyeO+JO0/Ublz6eykH4v463Bpd5gs10+bAjVN7CTylJEvv8vursoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GMJQQ1GU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.8
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010008.outbound.protection.outlook.com [40.93.198.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B944606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 20:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B944606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GMJQQ1GU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z419yW/dFGNWABHraKULOAeUbpdKu0X4ClkJRFFmHNfbNtdHhWfJhGngs0tFMfA3QuokRKjwvHVnuU/apWk4Xc3aXlsJupZZ1I8bnEhRFEuXd1RJpz2zia6UMF6uxP3KjLGbKyPjuiTRPSCItmEE7dO8XKFDeDO6E+U05OQ1sX6O5AJdhrZNyNZ/72tafI+SWbDC8lDQplbOqcqgF80uv2eDkQ5dGlUczytp1LnigSEYdmK2WxHqz2RjOnF0RdQWVi0Q9M1hIeFciIiICGralxldFPMYnAKCuXlIXxasRLiIyuIHpHimW1ctarGc5F/asHe/W8sbFyAb0vrs8/iNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z82dUvqWgEBNMGJDLiDHdf2UMbdFsavJUIvq4KTBgZ4=;
 b=p5LyifRh1geq+xVbtgLdMK97U0tmy8P1Kjz1eH0ODNcetj8tMAiZEyAPc97iooGe69bSEyj66SmUEtNo6bN5FaaFy9dO8IIjpZH0GyjXam2KavHNw8KliOo2+EqIbD5cwBt6xHKGvT94JZOil1MoEgUHSTq2iMnQQNz05gamlrIkzWSUVN7SB9GOpRK/BRqgFoKYImR1Tf3WchbAHTwPc83OzX3HLIC5lD1aUpqNcpftX4rijuv3FM2aJnx84l13JGFUXIF/iJp2C+6wn/usl2kDkaZgZHHTG9RuK/07m41yQWdssg6qZXwS50vEX8JZ4ILlbpiyODdLjpuSn6vIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z82dUvqWgEBNMGJDLiDHdf2UMbdFsavJUIvq4KTBgZ4=;
 b=GMJQQ1GUKc0rGWC1HBJ9S0ym0z6sMExxjQdbP0QxzBaGuE+3S86jtdwNemBm2LDYF+63XNgRz/bYQGctpdwZ71P4d6Vghakapst7mP2/HWfOUgbjwJzaAB1x1Uwn0VBK2VHntCRxin7ZRKXbPM8qoK2hbRbFUJel6qr04QmQTT0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 20:15:32 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:15:32 +0000
Message-ID: <04a251a7-7c45-4982-9135-a9a3524055df@amd.com>
Date: Tue, 24 Nov 2026 01:48:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/24] soundwire: amd: fix work drain ordering in
 remove path
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Poojitha.N@amd.com
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
 <20261123170520.1380924-13-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-229743@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-229743@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0288.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::16) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 51063b11-9d7f-4cd8-e834-08df499e869c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|3023799007|56012099006|4143699003|11063799006|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261022075727099003|261026140227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	R4ML8448WX/slOQZyilLd9lWzOME9EjtwvwJhm/kgostMKuNIjhlbYKYjW3FEJsulj18PomPuEYha9Bu6X8Il/Nh6kMvlzN1nfwe7C3kaoefEc2f2T1RDPQ7uwIwbJ854OkaSMPPmDqh1etOmx4uG2i/SC+vqBrRYAiuc3b8bnXAUTuO3qHjlUFD7hL0dOyc6OnIm/jT3V1y4uwIumPyXoqHNRiNsBnUnU+m3fRwkq1dP38IYhOFr2XE92aaawIOg1XTu28QHdfJExpwBZZYw/8ikxDz7BCMJwQu4BTprA6T0tRKXRukdpH9NgG6iDIGY+vgj5cGWvgbQ+rZwR12bQZwmFtXUy7E2+Rr8X01LgU1h2p7RYgXuakyr6eFGALIj0W6oIHJpeA0FEYNLscYedndK6SlGo6XJSh2ggiferFDaUpOlby/jla/8b2dqWty+tAa8OCmGs89aG4sgAeUoIdmNbHesSc/zEbnV7cOmDbZUd+tLl3AmbDRIY/gb01xt2vDumZaOSgdRB8KDhW/SegoaruD57labWT2gGPl0tM0PKI64zWaHC2g7ZLX6TgIxP4br1/8VI21gzJKj8W9sT9dczu6okd+QZdE2ie7xIqxtx4PwMiIMaYTsbxvfP+Tfvw/bXuvKWAbmXBYYQLdPMGuGtmdRfMKHUFA2HrXQ28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(261026140227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTRqRFJ6RkFQeTBONmdQdjZmR043RWpXbnpIdldmdWVTSkZ0eGNSZC9idDBK?=
 =?utf-8?B?RzAxNFI4OENJdVBjSjBRRFBNeHZWeW0rWFhRZ3hhMkt6dFJ2TXFzM3RYZm4z?=
 =?utf-8?B?VFdtZzYwVUlINjhRMFB6RHVCNGhyMHJXdkdPY1p6V3B3eEE5M3lIM1cwWlMy?=
 =?utf-8?B?cjhJK01SU2NYdlBodXRIVlpyMktjTS9WZDJFY2lvUHVZVTFqeDRQNXVVb3Ns?=
 =?utf-8?B?ZUoxbHcwMWFpdnNPQnM3TU0xNWZRUzRtOGdjWG1ISDJTZHNCU0VvTEoycWNm?=
 =?utf-8?B?TzlzY0x0UFBJeEJwSjU2SUw1Ry9YVll5SE9HNzNaUmI2eTJaRjhLT3hnM3FI?=
 =?utf-8?B?SWVPTFpLdjR0blVHYlYzdXNGRWFDcStCUndLM1pqbEJBeU5xOWVUKzNMZ2Fp?=
 =?utf-8?B?RDk3cGpCeXBmUjBnTDFiWitLQzJwT1RMN1RkNUFsVlVEdi8vV1VRN1RBK2xq?=
 =?utf-8?B?eUxtOUcrY1JYSEVIYlliZFFOZVhwTExXZEd5TFZpa2ZKOEhjMXRoOFQybXZR?=
 =?utf-8?B?czFhaEljZTB4ZlYzQVBvdGFrcjRFTlo3dHRNSlVBbEt5ckx3Z21YYjlWNFVV?=
 =?utf-8?B?bjlGSFRYQndCdy9PNXpxcnpMenJTRXNQdFJjRmlGZnpseU5rVjhDNmVMb2k1?=
 =?utf-8?B?ZlBxTjFHNW0yTVo1TVhHOStBdW1TRElMVFdxaDJoWndCZWllanFpa0VMZm1k?=
 =?utf-8?B?L2R2ZDBVdVZabDNVcXhSUDRodVBaNHhrb3Q4ay9OVEt0d3lxVlo0VXMrR2lm?=
 =?utf-8?B?cnVlVE9BTSs3VjVqS3JVTXovTGRJWi9GM1ZRRmpkZU1kc0VaUTI5ZnA4TGxs?=
 =?utf-8?B?V3JacjdwZWJnbUcyODdDdU5GM0lNSjVLc2sxQTVMUVljM3Z3UlpRTGtFZ3hW?=
 =?utf-8?B?b3ArYnovamluWnhxdFMvQXVHR1hNOFdXbXBhMmlxNHkvRnMxYlFvV2F3T25p?=
 =?utf-8?B?UTB3TGNnNE1qbnVYM2RvWGhLdHc3cjU2QkhWR1BKY2FSRDhZUGV6dFhCQnpC?=
 =?utf-8?B?TmFUSVhiMHkyUENGbVNYOWNjMG1BTnBjRkxSdlprbU41czF3SDEyQ25mT2hN?=
 =?utf-8?B?NzNWakVJOTdGTWxKQUgxcmdLRG0wNW5FK0duWEZKckxyUkxUbnV2SXJLbDE0?=
 =?utf-8?B?RXcxV0hJVXhmNkVvNlpxa1BGc2RjcHovSHk1YzlrRmsxekJvQS9QcGdPTW9X?=
 =?utf-8?B?NGdpS25MZTA2bk0ydkorUFpBTzRKUFAxRDVTdm5NNHdKVy94WEhqRXhjNjJE?=
 =?utf-8?B?S2VCNFZHNzJUN3dKQmMwcjUvRjFQTDhHcDZ2ejZpTDFDZDhGdGk0b0xRN0dQ?=
 =?utf-8?B?OGRWdnhxcCs3S1FHeEN1QkgxakJEY3J1N2tTek1BVFFMSEoxMHB1d21NNENO?=
 =?utf-8?B?Y1BneWQxajNKd29XRFprRzBpWnA2L3JrYTdUekJ5RGtCUXlQRHhoMFVxU3ZL?=
 =?utf-8?B?OTB3WllDcHNKaU91U2Rya1JzV1lSbVdtN1U0eFJFTVVLUUVWZGRaV0UrNk1D?=
 =?utf-8?B?TisvUGJWZzQ0MnRnRUZrL3VWZmNGd2lncVJ6YkEwN1JwMlhEeXlFSncxaXRy?=
 =?utf-8?B?M0FVSjJzNmNZRWU4M2MxQ1dBWmJVVzl0N3N5aWN1YXg0VUM4QnlXbHdMY1BF?=
 =?utf-8?B?bC9CbnJ1dncyZWpSVFp0VFd0dG1scGsrYStDaXZFbEdRZUU4OWo1dnR4bHN1?=
 =?utf-8?B?Vi9mTG9Jelloc1V0LzdPM1hLV0NVMTlDV09zMW02NGlEWXI5dXFkM28vR1Vx?=
 =?utf-8?B?WjNuZUdHbEpqM0E2TzBuQnA4OE42eHVhejRmb2txc3FvK2MvaGRLM241NXRm?=
 =?utf-8?B?a3ZITlNMeklsUVFubHRvYUNPZzFDbS9RMnAvTDdXQTFrVEFsUHNJcnZNb0k3?=
 =?utf-8?B?b1RVWWlibmlSTTl5QkgvSHBUT0JCUENjdjFxekJyRi9HMFZkbHJEZStMK0tQ?=
 =?utf-8?B?TlpWTzdHMmpCWnI2L0NwMWxZMjVvbTBIeWNBbkhDcGZuamZOU0hrc0NkR0d3?=
 =?utf-8?B?YTM2ZjVBQ1lNaUVJaFAreXRJa3VncHNjVHhITEwvRVdyVVRpTUFrSmhKR0JI?=
 =?utf-8?B?aHJvODdnQ3RiM2ZIY1RZOHV1b0xZdVAxWUNYZzByRHJmSTdHNHQ5Z2Z2WVdv?=
 =?utf-8?B?cE5qVXlKd2U2a1BQdDA2eGFwb3h5TFpJYUdUMUowUTBacHlGWGlyam5IYXQ1?=
 =?utf-8?B?T3Z1aGs5d1dxYThJblFRd1dkTW5uVEFUamFyazFKdTBwRFJvbzZPRStzbGQw?=
 =?utf-8?B?enZWWEpNeHVQRGZvelJ2Vlk3MkExOHJIUDc1dWpCSENjWTFUa2p6SzQwRmNC?=
 =?utf-8?B?S2FiS29SaUFCWXA1UXpsMG9zajcxcEthQVlWdlZialVNNklaTEVUdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51063b11-9d7f-4cd8-e834-08df499e869c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:15:32.4294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLkEbQXTio3lyItkzCDhN7IhaswQLJyGXbkGbgWdanD53AYi37knbRmDe9OHortAqGHJhVqDiNWzl7cdf2DpLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754

On 23/11/26 22:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] soundwire: amd: unsynchronized in-flight IRQ in
>   amd_sdw_manager_remove()
> --
>
> commit a1b902c580b9ecf41d510f5e3161a9e0ef33c879
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix work drain ordering in remove path
>
> This commit updates amd_sdw_manager_remove() to disable SoundWire
> interrupts before cancelling amd_sdw_irq_thread and amd_sdw_work.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 9715e2eb22498..44ef45ba943bc 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1265,8 +1265,9 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
>>  	int ret;
>>  
>>  	pm_runtime_disable(&pdev->dev);
>> -	cancel_work_sync(&amd_manager->amd_sdw_work);
>>  	amd_disable_sdw_interrupts(amd_manager);
>> +	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
>> +	cancel_work_sync(&amd_manager->amd_sdw_work);
> [Severity: Medium]
> Can an in-flight parent ACP hard IRQ handler queue amd_sdw_irq_thread
> after cancel_work_sync() returns, causing a use-after-free of
> amd_manager?
++
++

No change required. False positive for the AMD ACP hardware.
 
The race assumes that the in-flight acp63_irq_handler() on CPU1 calls
schedule_work() AFTER cancel_work_sync() on CPU0 returns. For this
to occur, CPU1's hard IRQ handler must be delayed for the entire
duration of CPU0's amd_disable_sdw_interrupts(), cancel_work_sync()
x2, sdw_bus_master_delete(), amd_disable_sdw_manager(), and then
devres_release_all() -- hundreds of microseconds to milliseconds.
 
AMD ACP uses a dedicated, level-triggered, line-based interrupt, not
MSI/MSI-X. acp63_irq_handler() runs as a hard IRQ handler with
interrupts disabled. It executes atomically and completes in
nanoseconds: the path from dev_get_drvdata() to schedule_work() is
a handful of instructions. By the time CPU0 begins cancel_work_sync(),
CPU1 has already called schedule_work() and the work item is already
in the queue. cancel_work_sync() sees the pending work and drains it
correctly.
 
The extended delay required for the race is a characteristic of
MSI/MSI-X based controllers where interrupt delivery can be deferred
or reordered across CPUs. It does not apply to AMD ACP's dedicated
line-based hardirq handler.
 
Additionally, the companion patches already merged in Mark Brown's
ASoC tree guard adata->sdw before entering the SoundWire IRQ path,
providing defence-in-depth at the parent ACP IRQ handler level. 
> The commit message notes that synchronize_irq() is skipped because
> cancel_work_sync() will drain work queued by an IRQ handler already in
> flight.  However, cancel_work_sync() only drains work that is already
> pending or running at the moment it checks, and leaves the work item
> enabled on return.  If the platform device is unbound while the parent
> ACP PCI IRQ is active, an IRQ asserted just before
> amd_disable_sdw_interrupts() masks ACP_EXTERNAL_INTR_CNTL can race with
> removal:
>
> CPU0                                  CPU1 (<hardirq>)
> amd_sdw_manager_remove()              acp63_irq_handler()
>                                         readl(... + ACP_EXTERNAL_INTR_STAT)
>                                         amd_manager = dev_get_drvdata(...)
>   amd_disable_sdw_interrupts()
>   cancel_work_sync(&...->amd_sdw_irq_thread)
>   cancel_work_sync(&...->amd_sdw_work)
>                                         schedule_work(&...->amd_sdw_irq_thread)
> device_unbind_cleanup()
>   devres_release_all()
>                                       amd_sdw_irq_thread()
>                                         amd_manager->... <-- use-after-free
>
> Even with the interrupt_enabled check added in the later commit
> "soundwire: amd: guard IRQ work with interrupt_enabled and clear STATUS",
> amd_sdw_irq_thread() still reads amd_manager->interrupt_enabled after
> devres_release_all() has freed amd_manager.
>
> Using disable_work_sync() instead of cancel_work_sync() (or synchronizing
> with the parent IRQ after masking interrupts) would prevent new enqueues
> after draining finishes.
>

