Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012016.outbound.protection.outlook.com [52.103.11.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6460D374E66
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589762; cv=fail; b=uWB4kjODgUPzk6glf8JziqJtIjdbAQ3EKM1HPk5ggqJ/7bE9sJ7g3xsI+9SNT2FELZ1UK6PjyTMYgkWLzWDGYrqAOQJzgnxRvU1BrYQgfhTKvKrEtZj+LanFNI/9vpAMnG0V2/+IhLiOp3UkRDGz/3kQzc49wKUOSJn0+hpA4PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589762; c=relaxed/simple;
	bh=PVdhQImXUfqHpfweCm4jYYIYLUtE7ooP0xmVmZxVGXE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nozoevbuu+iEp3wkc6t1GN/C1ifnWxpi1oWRIv1SzBnDkEot1OL9j7q/xANH042xI6R1jJeB7dITL8lmYkcmM2ciYItXM3NwtKxoI3h3A41ufV4BoBzL8uY+d01GT7at8ikVgVgE+PT6tANDdQuCpe4t2mTK0opYi6FhxCqRjys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Vu9bz8QH; arc=fail smtp.client-ip=52.103.11.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Vu9bz8QH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucfVVtp5Wn6aiSuz/FwM5EuWuexWmjKGAyilFvo1aEmxAwWjmeqw9f6B8g9+W/riIHWDxtCJZi0ZjYp8IMEAqslo2rEYYJk0ABzlf5/8vNvo+S5wps+Bls/swq+kzSPfzBDwNYrdMDJYn4Ktux2LQrjiKhRcqqpw70Y+aDbFJFEIR1319fqBCBUkFxSBmc7vMVKktpyQgv6uQGTQJZ95oE2qS6Lix48v80pfTVFIUXKvxTSmEFI5v9AUqDi+YD858t49+9RsXGW81t2g6WORlXCujO7sGuUflXmfRZmIyWl1T8eEno6eaAAqBhmmpRhKMbTvlAZahtOlD/16seXAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCtG8rodLUO9ESz8WbTR+i1MNxWRoHq0KEFpDg6vTIA=;
 b=w36iSTQjV0ilRH+qqzolaSbOt0IbYoPyOvC/EjdI7eLtT8aQ9fjEySSI4HFhuRfmXFqcnGNDxfYyf8QO53FPr2t34iswER8H8AMBTBL2CvedInWSWrTHzSiUyLHoLmIz0aCW1E5iYj5nxflCFZJBOIlUgAZ/Jn62u9lQ2tcSF/aG3BP3GnAlQCjY1tiUmcP0ldziYZnMtN4f7zsYzfbURNNKhbODIRglmvMQI8e50zNvY9yPNzgyzLt8HkfxRGDBc7wNYOTAXUbDgE3fhlugwRCl8/VA9e8uzhr3TmsOS5csMLX67ZhDILeSDba4NwDwPP3PfEEF/ezn1HdmePfbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCtG8rodLUO9ESz8WbTR+i1MNxWRoHq0KEFpDg6vTIA=;
 b=Vu9bz8QHzvAmiiCt02ToA9Q73dIsmGlyn7vnCSShWqjFkSoKwbFSXJE28jcYw+91axyAMtTfWLTHOW2h0SKH4GeSXLkdWQQ7npCj949OuxcL+VSzpeuzlkoxXihM5lkqHkwr5O1Q0L3HxC6I5/ENjfx+q21Gt13m/2aheGR2iUFR1z6XoJcKJwPcLojuBNuIftLWk38IrHrK2GcpV6TBb6m5Of+7bIxqAAX1TnhiE+SwnDJnecgXA9TnWpdsRtIqqGWlVrm8RA7EfAknU4mO0M4lsMgxb5QqNWDRKXH/wW1Uy5G2hlpe5aLiSGqHtGceq4pSvS6lBXtOq7L+YLAr9A==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by BY3PR19MB4993.namprd19.prod.outlook.com (2603:10b6:a03:36f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 09:35:58 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 09:35:57 +0000
Message-ID:
 <SN7PR19MB6736CCD8B936329A2631495F9DFE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 9 Jul 2026 13:35:48 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] Bluetooth: btqca: Add IPQ5018 support
To: sashiko-reviews@lists.linux.dev, Bartosz Golaszewski <brgl@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-2-e476c41f03b8@outlook.com>
 <20260709093154.382441F000E9@smtp.kernel.org>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260709093154.382441F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0041.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:58::7) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <61cd619a-d648-48e5-a556-d9ccc1bc4228@outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|BY3PR19MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: eb71de78-1dbe-4744-0c67-08dedd9d79eb
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4AF9RU1DQibcH3RpjVWHpU3jCH2PCNnA5lVcKRF3kC339QrTdjAaCcXxKuZq5z303WouLYa6bg7VACq7TAAXsiIH7oJGf/MHdoDWCoXNKtd1UVpFFeGnqbGkfuKUW/pfk6iDuhrru34iKDi4qve/djmxvDTK2xAJQZoLFKh3uVqk53q+rij3zqp7CrDRSCA3H2No5LfWqCA/bK7LRoMMdyuAY81MfzgAo3EwvRiQixlmPqy9pn6flSacx2hjlUrzb5xBK6h93mKd/38e63dZmOVdGbV2QDJnX71NgQzO43gKFk29k9Ys54LfPJ8ICs0mzllzXWHlPwOqXDVZyb9syG04ro9o42sIddxxz/ukaVKmXdgn7a3kNIicFB1ZRSK8BcsYnzE01O4+kr5e8nTQiYIazYJ+aOby13+8YA0N2/bdoWRkaP41RrwmI/6l6c/94mHdE2CRLXPHUd2wm6jjVACS22Q7fQUa556umpqk5K8gB9luafLPuT6C1fOcWWclwpUtRcn1tMMuVDblt9s+ncBdYFTjOpDQsHmVBOcZdVkQP0zVhCVoKfI3CM49tZAyZqC1ObiKcrf+31TiMtqiRp83wYK+ENvaaSbmun7wFv6HgFcFFesVCOulmDIcaW115X0ggCYRRbDXwrOO1r8a6RhnkguQkKWbQLN1AlLbh4ipm/vHoV7YpFpOIWuPrWZ2zJfSWCVIeIp8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|6090799003|12121999013|5072599009|51005399006|25010399006|15080799012|23021999003|37011999003|24021099003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0R4NngvTkZNN3gwS0JhZEVZMXluWE4xQ1VlNjhxdUNjaG9xdlhLRlhpdWRi?=
 =?utf-8?B?MEpLdjdZZld2Z2ROR0tDWDFjNGFSRXp3NEF0NElSK3hjWERiMHR1Mkk3MlhH?=
 =?utf-8?B?QjhHUCtpdENKNE1DSTFDay9DZ2dpanZxVWNIbHkyN0JoN0NaZFdyeXQyYXdK?=
 =?utf-8?B?dGZCVEYycmlrRldKaW5vbkh6OUFVV3Fkd0VycVlnR3l1Tk8yL0pLNmdSV1JJ?=
 =?utf-8?B?MDhHaUF6ckVRejdYaG5RMkd2THBZcHltVnFJeUJ3WkN3VTdjTzZCem80MGVi?=
 =?utf-8?B?cjBnNVVscitpVFp5bnB3Tmkrd01vaTczOFh1ay9UK1F3VUdhMzd2Mmh0L2Z2?=
 =?utf-8?B?TWpSd2JnbTlhZ0pOOU1NR2NTYlhFbmFDZmEwclVhRnpKZ25TZUhoREpIRWti?=
 =?utf-8?B?UzZvQjA1T2p4K2RHdFBva3ZqbUY2ZkJUWUNXRjRlYkhLc0cxK01SbUN0eUJa?=
 =?utf-8?B?VzJjTGR3M2xRa0tQY2tqMW5FQ1F5VGdiSGlPZVkySlArTTk0alJ1RzQ5ZzFq?=
 =?utf-8?B?N21UK3QrODBhN1YyeUY0NThOTys3SHdEbHR3ZUJwUzZJdHljS25FUTdNRURw?=
 =?utf-8?B?aC9vRW5BeWM2YU5CSFArSFp5b0p1NWhzbzVjSUNqclhFTWtqK2VicVZwMW94?=
 =?utf-8?B?cElaVmpFZmtvOEV2TmlFWk5TOUI3aUlWNWd0bW14YUUwQ2p3eVRsMnNwVEpt?=
 =?utf-8?B?bUsyYk5neDJEVHNjZm14WWVkTWFwd1NnMmpOWmxuNDE3RkhIUjB4Q3hHR3Fu?=
 =?utf-8?B?WXhMSTNnSGZUak9paGRZdmZab2JkU2ZqcCtld2s0alVibElRdTJuRzkreEJ3?=
 =?utf-8?B?MjdYYmp2RzZ6SmlKVnJVKzExdHN3NkdqOHdOM0FpL1ExUURQa0RXMW1HWDlO?=
 =?utf-8?B?dXFPVU1WSDgxZUNDZ09UTTJrM0cyWFJIQ1cvbURDdDgrMlh5QVNHOFQyWEhp?=
 =?utf-8?B?cFdGWU5QamJGZE9neFVRZGZlMzA3ekVnYkdUTm85WEc0NHlKUjNkRW1RWVVz?=
 =?utf-8?B?eWJ2S0c3OERFcEtGVi9OeitZTmFFb25VNEhrdmZibmRZNnZRQmRqL2FuTUc5?=
 =?utf-8?B?cHNPdkJlUmRoOGNSVUE3bkp6UGowRHRHcm9oL25OTmFlWjdZMkllOFNSSVJT?=
 =?utf-8?B?OC8zV1ZYMU43eStGZmVxeE56b3pjMnFSaTBZWEYwTlVsWkV5TVFHN01RdFZr?=
 =?utf-8?B?YUk2VmlzcXhqYjZFM21sMDRxRndncmFvVForQzVtOW9RR1dNMVZtMU5rQWpQ?=
 =?utf-8?B?eGNORFlwRE96VUxEMXUzUERGRVhKR2ZIY3lEMzY5ZWE2eW5vTkgvdUR1V1ZU?=
 =?utf-8?B?WjBNM3IyRWZmY1ZVQ1hRRDl6VDk4MUR1MUIralZ2NmZlRlpGYXVRUEFSWDdY?=
 =?utf-8?B?cVI5aGxSUFRsdUE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnlRakVpd0ZrcitzWk16NDBwMDNhdW1ITEl1Um05RmtmdG05MkVLNjBNUnpK?=
 =?utf-8?B?RG9PdzlYVDlhcHZQSnM5SXk0SkFQNC8raEdycVhSUm5WMWdEWFdtNzZNbWRx?=
 =?utf-8?B?YlRQeERBZFN3N1NNR0dJRTZqZkJtZG04TXJQenlpUG9GTjVQZFczSkt0WDNT?=
 =?utf-8?B?L3ovQmtCeFVod2tyRC9HeVZQb1cwbG9NMjhDcDJ4VEJEZmJRZXdnNHlVZzd1?=
 =?utf-8?B?SngzOWorQzI4WHF2QmdLNFU1eVk1SW1KRnB5U252OW1oMzdoOGUvdVlteXhN?=
 =?utf-8?B?R3V6ZFQwaDRZeUx2MFM0QlVDdDBRUE9oRkdySXgxU2MrWkFOZC92TC93TnlE?=
 =?utf-8?B?VURqbGltOE9FUmJsSXA1bkYzNm5rRG9YSnVodGQxbndjS3pOMGl4eGRQV2Vm?=
 =?utf-8?B?S1k5L0JzMTU2WWt5Y25POTRVVUdVUGxTTlFPUk9lNUQwVmlveUxGTGV6V0tr?=
 =?utf-8?B?c3ZXbG5LVXpNekQzMkdMa1BPOEg4QW5QSkE5SUE5UU0zaElsWmFjQ3JXNE4x?=
 =?utf-8?B?RSttbkpqYzR2ak1JZmZNVi9oK1JKdXJ2QTVaUUNRcjczd2RsVmh5TXZreWJw?=
 =?utf-8?B?akgvcUpzeUc0K3B2WkorTEdjSEorTEdXd0FtRllvb2lQK2R0OSthbFMwbHlO?=
 =?utf-8?B?SXlXUUZBa0VRRVBCc1k5TWZrNXFHUHVYaVpwQjBsTWEvenJWK2tFU0R4UXRR?=
 =?utf-8?B?amEvK09sUjRIcHZKVURISTlXV3k5Vnl0UjVGejAvWkVyNVFKT2RBcldNenlQ?=
 =?utf-8?B?WE5KdGV6eGRNMEN6ZHp5U29wZE9ZRGdkaTF1ZVFueUdXK2QzQUs3WDJLSUVr?=
 =?utf-8?B?K0orRlNQdEJ5dENBMitpUWZQZUJaNjduandYTGlRcHZ6VDJ1ZDEwNkdmMEla?=
 =?utf-8?B?STQwZldJS3c3YzVzR29yT1MxQk5QVWkzaC9sTzRRSllpeVlWcEp1TUljUUxD?=
 =?utf-8?B?R3ljU29XUlgxbHlWSjhQVURXVFNMeGFCZXZVSTFGSWEzOWsyWDNyWlNWeHJC?=
 =?utf-8?B?cXNTeS9OWmp0OHJxR0haNjZUaThoUmRhYkEzNFp1NU9yQUEwN3ZIRytGd094?=
 =?utf-8?B?VTlyczhJQjhnV050TUtwRlJZR1lmREtSVENoY1kyamduZ0p4dlN1b1RVRS8y?=
 =?utf-8?B?RHdwanBIZGtzaG1IcEVFd1Fudm5CTmtZQzRsYXNmUENuRTF4czlGWHFoKzZR?=
 =?utf-8?B?VHBOeHBzTlJETHRxeWJCdko1MnU5QjNmc2NucmFzR0NzVG5NWEFkYUh3ejRY?=
 =?utf-8?B?SFBsT0gyMTQrWG1zVVhZTzJGZEVFK3ZXYmozczBIL0U4cnFxV2hxaE1lMjFx?=
 =?utf-8?B?OWlOcDcyRWZFanMzbXFCNnN0MHI3SlRPVnFua0hOc3FMaVo0blZuNkJFcmgx?=
 =?utf-8?B?WkhMandrblAvZW1VR2dDeXp1ZGhXdHlqeGJEU3hoWTBVSmJKZncwNmhrd0RE?=
 =?utf-8?B?UnllMDJKOEFhRnlweEJtNy9SMzNWL2Z2MzN5MnhsQUFqdkN2NSt5WGx5WElT?=
 =?utf-8?B?WXdsQWI2clZpOWNyWWFtekdtemN3QWJySEtxWEYwaDdTTnZqcDF0cWk0OE1W?=
 =?utf-8?B?VVY1SFcrcVJVMXVxYnE1cUxpY1FUUUw3akdIMkpDa0NVRHFQczVNek5OZVJX?=
 =?utf-8?B?N0NHVUduU0lyT0tpS01pZGx0S1RkMnF6eHliQTdMbm9aTWJpSUowS1czVzA0?=
 =?utf-8?B?T2FJYmlLWGhLR2h6M1V1U2szYi9sNU9xRHF5SDNSdjUxS25CYmFGb0g2RWUz?=
 =?utf-8?B?SW5YV3d2R3ZEL095anh4RS9kNE1BbjU1WHJQaHIwTVMways2dTFDREtOYWNJ?=
 =?utf-8?B?OFlYbmlnSzlRSXh6MDVjYitWMlZ1WmdOU0dCR3g1cFo2ZG04VUl4UnBYckxz?=
 =?utf-8?B?cnJVUjdDak9mcDhKcWtzYUk2NzFyZlBBZDBwTjZvRzZPRHc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb71de78-1dbe-4744-0c67-08dedd9d79eb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:35:57.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4993

adding Bartosz, Konrad, and Dmitry for awareness.

On 7/9/26 13:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incomplete implementation resulting in dead code: the QCA_IPQ5018 SoC type is not mapped in any device tree match table.
> - [High] The implementation unconditionally skips downloading the required rampatch firmware `qca/bt_fw_patch.mbn`.
> --
> 
> --- Patch [2]: [PATCH v5 2/6] Bluetooth: btqca: Add IPQ5018 support ---
> commit 388a60ab03a30caa9b4a4e153c1ccb4a83f4283c
> Author: George Moussalem <george.moussalem@outlook.com>
> 
> Bluetooth: btqca: Add IPQ5018 support
> 
> This commit adds the IPQ5018 SoC type and support for loading its firmware
> for Bluetooth support.
> 
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index 22b08ab05b829..f5ded8fb1e3ab 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -775,6 +778,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	else
>>  		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
>>  
>> +	if (soc_type == QCA_IPQ5018)
>> +		goto download_nvm;
>> +
> 
> [Severity: High]
> The commit message explicitly states that qca/bt_fw_patch.mbn is needed,
> but doesn't this goto statement unconditionally skip the entire rampatch
> download block?
> 
> If a firmware-name is provided via the device tree, it appears it would
> also be incorrectly loaded as the NVM configuration instead of the rampatch
> due to this jump.

firmware loading is handled in the driver itself. The patch mpvn10.bin
is handled here, hence the goto to skip the firmware loading section.

> 
> [ ... ]
> 
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index 8f3c1b1c77b3d..343cd62d11371 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -158,6 +160,7 @@ enum qca_btsoc_type {
>>  	QCA_WCN6750,
>>  	QCA_WCN6855,
>>  	QCA_WCN7850,
>> +	QCA_IPQ5018,
>>  };
> 
> [Severity: High]
> Is there a missing device tree match mapping for QCA_IPQ5018 in hci_qca.c?
> 
> Without adding an entry like qcom,ipq5018-bt to qca_bluetooth_of_match,
> it seems the driver will never probe the device and soc_type will never
> be set to QCA_IPQ5018. This would make the newly added firmware loading
> logic completely unreachable.
> 

the compatible is found in its own dedicated driver: btqcomipc.c
