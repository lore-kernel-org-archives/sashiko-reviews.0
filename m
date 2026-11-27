Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795783472;
	b=YMDeMkyiqHZb3M8utoSkPxxne14dFqTGU6gzgsyvcBTRClMPNL4voE8hQ6hjpR6wtpb+
	 EJKWUT5pXid2HHsKgiHxNfQLNJAPixn7RSvXR421J36o+9aq7TzVR4uqwgmYhEWuDlD3W
	 CLi6ycfo34gjuMoMlMbRp/3+AkPCexwlNYGhhy64wqWcMUWOMQNSWB3hew6dxJY7gatVL
	 2C+/Q1I8mGgL6f395uRrqSWRmYZTNXffZAkiSc7PXWvboGolaMOMeftiStWEdWZGB8Idm
	 qL46YPGfe42zeeFWjq9cwSkbT0I+no9y0J466mn8BAJDdRkXbRUTA4k4/4Dq1rsIc2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783472;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
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
	bh=8lTL/zed1o7hVlFjZ9vzldKTHYQobJQw/ENT7t2DB94=;
	b=lHPNhPgOBUesnMOqHTKw0UPxGFb5nz+eGA+yzR+n3jdo5SAwCg4jjTqt20KfsL0Y48kv
	 YCDXdgpoqql2KzTN38S9PToM3BYcZZwJBT2otEgTigS3pGrmIJ5CHO2gTNEgLWND92xXH
	 Ag6dcu1+HsjURu8FZYG2r9PVLnsjGlsD/LL8+gYUdFKsyBMpgg0xT8UmtJADKI2gA4G+L
	 lfieE/XgD/D9PlFZERkJ4esRVzpslF3mWu8d5oKo683qQG+p5hPFangrMQQdTwK2ud4bt
	 wEiXzMsgNX0R3QMJEupIjC7kD1jX/25bKUQjap3vBtL44d1FkHToGseqWc+nMBJ9zSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CdrsXhWK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.20
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18EC606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 12:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CdrsXhWK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plR3zLxKVCjTX4aGmQewrC8B6Ji3KLgmH3+ppuGQ3DnCTA2eRY4VsoJ51xPJLsEFVuUfZMeiibvuyN8vtwfZ9i14nfktCxP9s03csUHkZWPXpAvnwZ/pM8oHCpg4dTwu2nOjOn6p8C+B87LR8995rcALlrXuqbqNgKhjFwB2ilZD5zlEnq2FOoovklZLZVXrjgEFwEGa3+LPDZND0MkYYrBqnI3//ursDo55z/I+gqREGZxwmPwePlykak2y+qStoAF2GA7pyknpXnQ+/+0dy+gUapUkyBsYaTEoXFjKMypywcEm/ypx8tqL4riLLO1w1RaV2jR0mqGM0Wsu+6WADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lTL/zed1o7hVlFjZ9vzldKTHYQobJQw/ENT7t2DB94=;
 b=Klj0zfuzC0/nLtyDzkzDMuxUyvwnuxF4uK6I6Mp3eWD0/+vJnak9oGQKnlHm8sH7SsGAcmK36/dyD3tBR/YMQ0ErEuUH/6G8X8afQR52ND/MdqwXlF60Vxw3bhuwVvYofgOehsQGKEtbnfouYwsIQlPnibFC51RO+OBY2UGAKvAEYhbvZm4Suze06J+iMPttOBqf616AzkOQ3oy6avCvyLi692VHlhzJdNo2qkynEDO9Yy62CrX08OarjT0ZYsP80UkGrHAX0prbjEcnpGjeIw2oLCUy1kkMll0tAdvd3xLxnHkByOm2YlAuldpkRh3r/InY0UOvIVu+wsDQOyHXJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lTL/zed1o7hVlFjZ9vzldKTHYQobJQw/ENT7t2DB94=;
 b=CdrsXhWKcE8dzY1PocWLOW4dFwa/FkXMAd5TP/ExMIEvydFgEMVJRmIB6fEOQAP+12waIZ3rYMtrUITSzptJX6yI2vrcPtI8oEFU3c9S56d0eYjeBU0hXbFP1OhUbz7ekT0aZAsEeOZtpcUnVg5x02+TsS7+4SUHcF9porse9UjnVjSHiXwbwTtyQX65ghaZ+PGk217IhJdCJvQD9m7Z8swpv5IKOqNuHtbxF8SFpEU+8yqGUUw3xIOuV5vO0hgLuew6gzH5g5cpQXnnpeVmnN63Cd4cr1ScTHLeJ4hQQDIXZwKmivHccsYOXuOO1VNFq6TTiL3I6Wky9JP5N/XQYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 12:44:25 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 12:44:25 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/3] gpiolib: release user space's lines when adding the chip fails late
Date: Fri, 27 Nov 2026 14:44:21 +0200
Message-ID: <20261127124420.3423524-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-236867@kernel.org>
References: <20261127-gpiolib-ownlines-v2-0-aambrozewicz@nvidia.com> <20261127-gpiolib-ownlines-v2-3-aambrozewicz@nvidia.com> <sashiko-outbox-236867@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TL0P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::9)
 To PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|SA3PR12MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c1d4a9-92d2-4797-72df-08df4c842aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|261026121527099003|261009223027099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	aFiVYt9jBenQ6E+OEPQyVTVNrm31pqvwNxoHwFYKxTTu2/XbiknOS9C9JqfV7zl5n5by2t968TGv5fXhLUAtt+G5O/s0Ij3VxloWGXqvv++hmPA1UfqJADZ9BYqMKIzKKH/syD6xVs8HUZ/pbtfvsNZbsMxlJ+37Yi56MdGxzChsfri+ebJO0bKYZIbgl7anjRbJg+SbD8rKcDmiDPwWybIYALVpYlg9Hj/xMW0w3HqQHHZCzA7D/8uKSlLRPJp11+8jfyh8tp8GGdVx9x+NiRmZ8rgX6JPcySfzOjC15MXuyCMZErHXRaqvnjlVGKeouMiu7QJS0FwbsMAXodj+yKvqeaMwW7KbFkHtox6elhdIFwJ5XzbgIo5OmX7djQl7jIq+nRrQAMSQDx6QfnLC6GzTgnUL0pKC/2zAP7CLUWR/G4H8xL90YpLjKGvQFhizH6ucpIYqI8E2US7Eb9rnlSDgXDsxBq4uiYCEh5keUIU5e3jWKPjXP/VMDH6UgtMbyeJQjRs/EjbeKkh6ni3Ecja7yFAEtx8RWOr6xwEjdR8FLhRmfYC4RnXt76/q9BGTezZY8zIjm+1W+g/oijg+j7Kkb/V78ZlFnRr6n1VCy9fmXKsWPDg8bO/CjLDIp47JjE1TL79S30iVNdzedG2OGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yba6Lay4+lb390pJk7ZBwoGvGAePxBs2MGI42lr3g4S+OUNzcNl4lYi0fbUm?=
 =?us-ascii?Q?DVVR6L9m7GK1M+8mvD+mZqYY+HNvwqmx5zDR+IwzFrje27oZOiiH/rb2L8j1?=
 =?us-ascii?Q?bwe0PxRxkhRLvWpTZuXIAMnmFsz44woJBzNbNNrqdGAmzw/bDWEMnyKC2NjO?=
 =?us-ascii?Q?O87SIEKJFEsGoeTqh71sRqkbPePQyVvRX3n/2zsz9DWK0iGRUPVH46a3GXvw?=
 =?us-ascii?Q?Uf+yWfC0PdzI19oFqWeuPtcWSQUOeoypKA6MOjK4hHX4AMWWjwvIkfK2QHSU?=
 =?us-ascii?Q?1zDyMImnzor1UX+WdsogL6MEbD9tE/QsHs4L3f6UXm+bXltx4GJlqAQSd/IB?=
 =?us-ascii?Q?qytfdMyL3VJ3WefkzD4xCHxslq1ML4PBE7kOeN5Ns2K8E2HE+6fSVkU0lp35?=
 =?us-ascii?Q?PDErRpMDO6BO4qFy2hf2d79uBYDFNXZZhzugdUqfkU9m710/p1f9IRXXS4C0?=
 =?us-ascii?Q?dLlwgFztLv+RGMBnL9Spt41Vz/bOGG/dUNb3Nrz8k8h39ITrHunJoY11yHCY?=
 =?us-ascii?Q?fi1lDRIDzUPYGA8DnOFQgQgNA/qKE1ypl/0rHsEFlnwSqvL4gJcnLUdo1muN?=
 =?us-ascii?Q?ymdkFv7XI0ufNFvVJLIcl6Tolt8H4HpuDyUntI2H+rjfYNBuFR99AAXuwHYL?=
 =?us-ascii?Q?o2tq7n2Q5AZzCaVsw4KCmlwJWWA6SEYOUUgRNvCF9wO85pFcFEYL7Sxe09KE?=
 =?us-ascii?Q?kSRgSTmoOmOuG1drEZFd4vvo76e38XRL+MmuwG5ikRDNE/2Mawr2Y3zrWP+W?=
 =?us-ascii?Q?rnCKnbKsbQdv5SOBQh9MMt7c/FWxaxRBXF0zajJw4t5UoKg1kQ/fl/R48uU1?=
 =?us-ascii?Q?THMtR8Nw+R7vAXcjjq6ofW0kLSZFfg85BiN9xWPfH1D4rFO4TZNRC5BVsQcn?=
 =?us-ascii?Q?lqmx5gBanCnixsy2VmlBng9CW/7J/Rgtd5ssfGC0HBvUhhLicJbNrVnRL6NK?=
 =?us-ascii?Q?2ONaR1YZv4Mb/YlUcU0CcF+u2z5Vv+o83TsfaddB17v3qBqtTrPJPUObBcHS?=
 =?us-ascii?Q?Lm5jyJcIZkJoR8rGKvSktRaxAqyFwYLvqYUPHRiU9w++sHE19hQ4FFsGDHPZ?=
 =?us-ascii?Q?GHwTj3qwIi53enjJFg3wEKpgprHET1ICXqq3+GV0zmW4MfanJQGCbHGblzUa?=
 =?us-ascii?Q?V0jAYUxpZpaQ/ywSQCTz06i0QSfTSQx9veVHLVADkvEaUzVVd4ZhI1gZvdpE?=
 =?us-ascii?Q?wXqIQQLVH1t1E1D/xO1bgfYCLXK6xrrN7AHXmJSPu+hYqTFXIPVPwfXDyXza?=
 =?us-ascii?Q?ImzpkMUPtINs/ugJBksb1yHqF0+zK8OsB8sSUI0LqhxI9KqV35nkRnevlpfz?=
 =?us-ascii?Q?H9/2RaewsmedWmQrr+NOIchmMEtNhxW8xH39h4kqCW8bsd+5hKaAAwXe+3Ql?=
 =?us-ascii?Q?0cfEGWrt1AqMbqU2/MEvikSt/PSWyHRsw7qdAYhK9OKcBEb1rQEWt14S47Yr?=
 =?us-ascii?Q?JgYdfjGwe/R7gO/womSJ7iYXXcFoMiJbjxRk3OQV4I01jIcsF9g7G2UkPH11?=
 =?us-ascii?Q?G7SQqhYwM01nu7pP2Dw5aS636PUPtSm4PcHTAF8L2t3Lxx9seFfi7viBJIEU?=
 =?us-ascii?Q?ZwfyEPdVsMFVZXgAWUaXiTNTHrj2y5kKSlMSqC5ehYAX6RRNCHD6crd0LT+/?=
 =?us-ascii?Q?2bQFfrfww2qSbekkTwupRL+yONn2wxFfqKmiyCV4lMzxuXYtIDEC1XSffeVQ?=
 =?us-ascii?Q?VaKa0xV8ZLpPLNBSxwOY9RqjccNxkE5JCRN/HYz9kjcq82VnqMRIUvOjTfMh?=
 =?us-ascii?Q?rZoulv3G8g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c1d4a9-92d2-4797-72df-08df4c842aea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 12:44:25.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJEii2qiWGsfZLAT5vb4MHk62kyH/mSo68UqUHxNT2HzFXwKMJcLmX6aXXiZ8GFwWSwEx1LGEMEeHUZ94QWN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7975

On Fri, Nov 27, 2026 at 08:08:34AM +0000, sashiko-bot@kernel.org wrote:
> Can calling gpiochip_free_own_lines() and gpiochip_numb_device() here
> before err_remove_from_list unlinks gdev->list and runs
> synchronize_srcu(&gpio_devices_srcu) race with concurrent consumer lookups?

Yes. A lookup that found the chip after gcdev_register() can still be
in its gpio_devices_srcu section when the lines are released. The
window is older than this patch: before it, err_teardown_shared also
called gpio_device_teardown_shared() ahead of err_remove_from_list.
gpiochip_remove() takes the chip off the list before it releases its
lines; this path does not. I plan to fix this in v3.

Adrian
