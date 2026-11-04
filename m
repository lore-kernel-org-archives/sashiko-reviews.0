Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822434;
	b=kI9Y+4bo4UMKELt8KviXfzdQB5vdFfvy+a8sO3YECW/YNlggXn7Z4AKjFwtG6V7Xkl1K
	 htc5wEzXnGkJUJSI+YLE/O/H4UITpueqQLf55seHAch7HSYE4kFfALds1YJfNOkS9p8WW
	 JAEiCWg6dG8QJrwP5gSBT1KgK7Ka5hehC1oOM2y1XVQa4i/fo9by/EXC27UgdWiHTRwCD
	 WaMe8GxSqp8kKqEGugvxvxHFmJxv+MyZ/Ex0+Hxn0oP9KmkO7UYQxgfXXjxYHVpWqlDmu
	 060HuMwUN7h02LJ1/tvedm/EXt/s48MUoxfkmF+c+Nha6qu93Xz+uOvqgAvSL8jCx4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822434;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1hEJuZdJxTZpIExKF59T8qjcL0QWIOvdaPxKws67mzA=;
	b=Qx7ktw7HtHjkz4cXig/yCHBLkQ/QB579LBd0USQpYZS1IH64jjpGOhMbXhzPuf/t5+RW
	 7O4FuPYG+i/ynZTwXA8LWyWltUbjvhAvpXKU5lF/SSjVF9kX2A9aN9tWa01IFh4006FEW
	 J7b31E8PTDur97y0FfWG6qjCPiO9LUR0+VYnEz+gAe6F5cln27Loax9ARRJn2C8aEJj0m
	 9TKz62Q6YDjxt1LQXRofuVy41+L2+w4sjD0inp0ol8dk7QRChZz+Q4Clcod7TkVlWt82/
	 LOSH+TWFRffCz3uuZilgw7qhG3oXkGH38d5uBzDWnMISbosKm2JY2THQIVXDwBwPa0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=M4sohpSi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.66
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D81606D4F8;
	Wed,  4 Nov 2026 20:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D81606D4F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=M4sohpSi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mf0I8EtJu689Fo9ZHTnTklbiE/pdmzwHPTFE8o9t1RbwtAuhYxQNwakDqat51xS5vlsN1SAuz6TEjyWXie1fNxCGaXsASWC2+bf+stKg+DLWLDD0R1ygA+3ftoE2nITaU9A0j+Q3DnMD2sxIkWC9yJg9MeqNdWvr60ld48UUPl9NTdjPAgPjLjm87rzmo2Sc9xXqub3FRu6MfCOVMnCpnrRgXH3/QSUUsB9q+NgR0kMbcCFXV7GRhZk3ZYAgivWlaQ059IiK+5dNCUBSqX5I1NKfV8he+fSbYciMHnKiLSdic8op7JL/8kuqL9bEecrM8Auk7O28qek6jZ5P3lgXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hEJuZdJxTZpIExKF59T8qjcL0QWIOvdaPxKws67mzA=;
 b=U5E8qllExsBLb5yVLh3yESNf7f7aha+RCeyNpox6htRgVgKTx01JEKKznFMSLzG9Ldp17hd0E2/s0OMjGgWrmKVRr7X3FnY3Qi+J5+gFOAIAssrad37I2kIzOgZWZTij3y+FhuNgP1cMBcqvn90153yOFgZLnUsFub0MYYvt9dQlDcfhUUUJvBrGkfKaZ+45SuPjozNFRdbXEo8irVi59YQDSt+FQH7DVok7iafAUkGWU05XMwLiKYSnWZ7iwbv/sSrpRvFhQOP+oEcmIFkeMLImyojDyrJhOdecfhaW37WUmQVtagGUN0+wKKbb4D+Kifpv9reW9xSs9A1SaMlVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hEJuZdJxTZpIExKF59T8qjcL0QWIOvdaPxKws67mzA=;
 b=M4sohpSi+Pidd3H0UZt7CBgmOLN4sqowpg32Yslm7iF/hogtK9zPvUHTIn5x7qdrWeDa/Y8Joib55aW6oySK2/Kh6PcgeLxsc4bdk5KaboVsUUM0At3sr8RfEDniMNpIDtPajZZwiFB5CsQbU2NuZ1Trm76EguwidKA/1Au3TuIfdV77F/J80MdDqOlMEH4CA+xK5LLa4FiI/ttU98iki2Y+gkXYjBFNMZFerZxFuQhoEd6vhBCkF0dYcZQdkaPmK7uOf+J74QKVA7Dtg+E3SsjiNIJaMuyUJiPW8aLOqpFSDXd1oRP7Zo01Va2WT9kPZazUlCw2x8+mMB/GLJdd7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10537.eurprd04.prod.outlook.com (2603:10a6:150:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 20:00:31 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 20:00:31 +0000
Date: Wed, 4 Nov 2026 14:00:24 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Zhipeng.wang_1@oss.nxp.com, imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v7 04/10] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Message-ID: <auuO2FEyr4BzlwQr@SMW015318>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
 <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
 <sashiko-outbox-196843@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-196843@kernel.org>
X-ClientProxiedBy: DS1PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:8:44a::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10537:EE_
X-MS-Office365-Filtering-Correlation-Id: d7087d15-6cab-45c5-ea59-08df3aae4779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|18002099003|22082099003|10067099003|11063799006|4143699003|261026121527099003|56012099006|261028144727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	aHEjZ3OLKemgAaFItc/Za1phpAMKx/bMHxE74CqSg/61aJXUG+b8YO+o0p1GBcExoBtSYfTd5sNuaQknEKRUr9uWmnUxKkZMczMuKGxfW0bQcWzjym8PX0qR+djDr+xYcITalMROOlyPtED4lEAPs6L0ZbY64WeZHlBUc2+GkLftw6lzGUCT8HLOU38I+86ng2swrFWydE52Ht/0dWJR1NEPmUCi5ArdCG+RLrV6i9khJthKLZrVvgadJgE+dNOJdKH1L5moe/XtkypAe4hfrajW357uX2YAWVY+LLsNI7Ouhr+rsIzO59o6jT2qD/uK426Y11cYFrtL+2QHXEk2l/1do34RtlPlb2w69fdIX6ybgqPvUdwFLijtkf7iu2nYj6mmlWt2lE+FJYCtVbe7sJie44s9dtnVJMVyuTdFYfPuNPDPwfKIGX9JrO8mqM244k4zMzAeDc6b+ucwT9LWm125IoPzjSK36Z7M28BcgK6xh7uADRwd6MmvHtJldnPMeTksw3APEBS2SW9ZR/GBp1zgEmjHlPIxiPK/TI+oGrtneQ1YKFc5QyBA9qgDC23PklXe39KTkqC8v7E6o9pxS6Pl/UB2+ed718/h+2ae/9Ia/Vl/8coAqdNqJuaP8SeqiCDSRaZdotmIJ1XZEoGOT78BYcHnCJXeJHLA/UqqpP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(261026121527099003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f3xulv57/i+aTC2bIa3x66kUlUbm4jSLWiyLC38ZMkI/FATJuqrKszEBCU84?=
 =?us-ascii?Q?SEBFFfX1T3VSuPF42EiKFPPGzQRebpreR/p5MP6O+8NSdFwu0NRZzDET70Ba?=
 =?us-ascii?Q?NK2VITRYeGiVwQBLRjhTwPc6hx+cVQMOnb+7Z2dodWTF18Rh4wz65VK7HyCq?=
 =?us-ascii?Q?GE2qJ9Xgc4LeapJFOHpkhNF6Y7tL3mwsxYHBXp/HTMzxJe7iMjdSaEtRQ3DN?=
 =?us-ascii?Q?pQVFUGNIs6ZAoUaCC7tqzNjXyEzn0y1HHUenI3+N5RTdkD6oDOXaNBokI1I2?=
 =?us-ascii?Q?Tdr23pOYXur/kOul4jY5JdX8RRAJIpC69kuBLH3gTklGDAakJtBDfvmnBKo0?=
 =?us-ascii?Q?20qsGHc8nJKenWeK1NfJYElpNvBituIlvNXXlIcfvUoiq4ShEKCBSh/R4Csb?=
 =?us-ascii?Q?QcgoOZMBlz4tjwytnBqWgLcrx23Zt8XLhF3IV6CNwz5slLHXII7qjpOizIIH?=
 =?us-ascii?Q?F2+V+otpR32Zn9qLNJrbqIA1gqsDx5KC7mIZimLm8ViiTG3KQ/xXOhu5Nktf?=
 =?us-ascii?Q?ZXdcTsnlQnhnSwvPFuemFc+lKvowdU6BpfGWRM0T4GlC1KKZlLy+gjRAPLas?=
 =?us-ascii?Q?wFQ3uDEjEciVk4O9xglwI7XI4dLZ7QRnizt35b0DNnGeKqK9TLOm+8R7vIC1?=
 =?us-ascii?Q?ESSrO+TbotkfgiNV5VWkw5Wh5tJ/658+MNcSnJwXTL1wj8L6lyRi+BGGXYBu?=
 =?us-ascii?Q?Zf4kcAOeJ1OwbCiiK3ighsTYzceryIb0P1/c7r4NqSmQwo4AaGgWHvMJqZRa?=
 =?us-ascii?Q?vdQs5RnD0iaAIHLGzOqeInzrj3fLv9YWDmdVhPH9Jo2vedqvRsUQu58VD6ss?=
 =?us-ascii?Q?wu+PSKoG22Ft9u+4hyE5kAVArefIp5V+85aXQu+cE0nZXFb8isYqHUPlGHvD?=
 =?us-ascii?Q?bcuFV5VTuE3HlaGCQTZPSqDoPP/L5N5bdE/RKwrERJokXkVJ+10o76S4fdIv?=
 =?us-ascii?Q?DgViQTNHBbuSfpNLcdLm5lM237B2Nwrtqi7ckCVnWtBRZRBMoSUfjlnn3HjY?=
 =?us-ascii?Q?vYXs8JwCYkkmRDAnFkDYBaTnocmGLX2rFMROUPiiKQuKSsGDb9o23IQiIDzU?=
 =?us-ascii?Q?yMnYkONm2/LiNRojLYrIRMvfaiU5SxQYmoIv57GXKssBm6j3+dFd/rwhSgfd?=
 =?us-ascii?Q?S152wGYKLM70WMch/4iArk2gpz6+kf/HdEu0GogYursFdVY6xMWNQphDnBtd?=
 =?us-ascii?Q?2fAKiy3QUtDw45bW3FN0eKS964czJCmg9K4DdjnEDUYsZCA6ylgaxx7wYWUA?=
 =?us-ascii?Q?cDqFk6cOi3FE9T4pn3z0qlHRoQJ+JJBUTl/8ulebuXfb1wYg1FhKl9obwmgZ?=
 =?us-ascii?Q?HH0gK/ox2YPeGNln3n/h0Wp2kx7UQ3g3gcGGyV+GBm/BhOQwFTr9lpjIktFU?=
 =?us-ascii?Q?Do+3miXYSOQCAMHy9pgPTNFJswAKSKObj98q6tfb3IqHRj+iGmAYQeEbcrPL?=
 =?us-ascii?Q?Y9ZfZ5aSp8YJs7Z48Eu0MJvGX4L7GkH8SMoK9Fnrb9dG8qIq4AkXaDt8TaUG?=
 =?us-ascii?Q?ma6KhPyM0bo8FUlzno9yKpWi4p0ybQQVs5VNjxzvrKWl+yJyYQxz2s4Ew3te?=
 =?us-ascii?Q?VsRMIjrTN4w4ckKMv0zXjqAUhBN+rTIGjPrNqAcyHQVbC4unfXjEtDom/qBK?=
 =?us-ascii?Q?7t7Dig6qGtjPjnkQ3cguPPSMZ4XheVZAx41YtcfQQk87yHfoG9wyjUiWNQ76?=
 =?us-ascii?Q?Ssuc/YB/erU8q3w9nXZJhUwQYOa9JjTv1N3/WpbM4mVwWkNmAsrlXEtuVzWH?=
 =?us-ascii?Q?SvTn/jzJ9b9KoTO0vqQfwG3BRJRhxOS9/uXF8Lue9teBN4V1gpy1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7087d15-6cab-45c5-ea59-08df3aae4779
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 20:00:31.0002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GycnLkkrT5DHDsooq69x59lq+gJ9RH4LApirBJdr9bl7OWShL1LZt6m4Le5ZNJ7RjCcdIpyE33cuo35cACf9peHx136h26dK/dtPqP1rrD9hAP0ZsANoLgSsZIIxv4uk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10537

On Wed, Nov 04, 2026 at 08:00:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] irqchip/imx-irqsteer: unclocked MMIO and double clk disable on probe error
> - [High] irqchip/imx-irqsteer: clk_disable_unprepare() while runtime PM stays active
> --

Please check this

Frank

