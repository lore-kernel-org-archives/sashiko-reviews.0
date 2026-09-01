Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0847424E;
	Tue,  1 Sep 2026 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256965; cv=fail; b=sFpIHqkzJnJIeaJucnWQubzvqeqfvejeVJdIriJm022EwvKOiyghMM3dnT9YK0A/Y7pq7WYrnXGVDQz4axO/1i/Op4SL5lcaQGOBLaKLv6U8iOUZQ/36OXW/GAwFIkIEuYEgGxUTYC1hlu0VEIl/8XXXedgCGVOunM/zXegbS5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256965; c=relaxed/simple;
	bh=MzJo2i/9el9D9/n6MJ7VTDMdP4TEBI05RVkuzMGjX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oz3pwTAbO29S9qGk/wNdIxdnbcWzRnBR42kfMeWPm3kAsZL/YM9VkfRq+WwrBMgVZ760OqjbqA0B/7pZ8F82L2pszSu+oJcr1SFsdj8tXOaTyW3DWpT76dHZDXmdrt2VoLPVkMW9k9LQDORS4b4qy/0YHw30e9OP6fcuA2dXUh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=P2Ua6sCj; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=P7y8dnjJ; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="P2Ua6sCj";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="P7y8dnjJ"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179c571247407;
	Tue, 1 Sep 2026 05:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=p3EM86GLyZ5OsuELGVqIwZNSkhw8rTtbYsRMqYydqLY=; b=P2Ua6sCjLYnk
	gOnkzCoDpjiKhaZgIzmUnvUBTFmpuGurZVHIKOr5wBpD6A+wjrtfXVnWD4/Ij5rs
	mhv6lxjyauQOQlwRdEeDj0y3gpFNp7MtHVSAFnnGmCy1YyeFCJMi3pzYCjHlz3Gc
	m8y1PYA6NA/07FVkDecfhoT0MeheGYxw3JLELr5+TlktfM8e06ljtKqFFXpsp6Gg
	OqOHZkF6mgJhKgJPpvLKA6CH1Ht3fJ9uvuOQD+OinL/YV+oemsB+x1DBY/cpjPHI
	x8Ok0ASPQJ8MlXq6caMpvLoIEmYZ+vQs3615iiXY2INfi0IYG7VnU5p4Q8yIClGG
	3NOSjahprA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022111.outbound.protection.outlook.com [52.101.48.111])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 4gbur6nye0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 05:02:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hp+SO4f7RzMG6XJ0bY3CFlCjrMzfDrTXUT/BeKwUeioBssMBIfZ63xamlzC1ngBIkqv5lATfDeVceQUTDvsYOpq4knlLwe0xwsR9V4nrJ6YxAS7bNN6JRQuF+tbm3ykFhR9aQIMEoyC/k0LiXQSarE0Jk+Q+jSAeyuZ4SB16psqqSQKfmKlHflAIqyVSPZmB8wsCZwc8XiXozGtOcw5GtIh01tRUhvF7zGviuuDKu/Ia0dK6YNTC0kw7yfPzAFqfbD/BeGRvBICnO1afdMBpDvQdhQspZpt48OJO7Ex6x7kY88FkvcHolm70gWA1kDr8ND5rcJxnZvX970QvmXjPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3EM86GLyZ5OsuELGVqIwZNSkhw8rTtbYsRMqYydqLY=;
 b=ahvdwrh6CitqTcewD13bGKniBu4JDO/z3Wm5jhMqKPWm9tuyehA41OZYbE5p/JRmhXo7kDOpddvYHBzlKV5M3cAfzo/W1ibnGq3QYDPw0m5LOqdtWRAvhqKbFvgwluGjh9gCs49MApeREQJQKeVN4c989sMlMyIi8q0H955fDbgkGAKEmRqYTt4JLUNEOgPYOYOULwx4Nx+S6DVch2XYn0agp3hw8fV4KMWvSKJ+eZxopnUdGMkN461OeOsioMud5WJ8cvMuoZrbPj2EKl9vmtb3kGGMtjFrVSX7wi59CDzkr4Rgcb8bLe45dv9hgelT5iLusA1iDZu6ExfRXUabVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3EM86GLyZ5OsuELGVqIwZNSkhw8rTtbYsRMqYydqLY=;
 b=P7y8dnjJS6kVuGpxc0LgrcoI5Vb65TkA/uMhxkFuBhNQtRhFg3yqt+C/X0RoBjWq5Pt4Bz/9u8/oLk/koO1VNi1Bx2Ld+sPe7AgApvtBLV5uupHbdCqgT98hGdAYjUgv/9JVhhUTcRUa3TngXRawmZvEGI1/Cr637DH1FVXtZuU=
Received: from IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 10:02:35 +0000
Received: from IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4]) by IA1PR11MB7773.namprd11.prod.outlook.com
 ([fe80::acd3:fd18:5809:64c4%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 10:02:35 +0000
From: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject:
 Re: [PATCH wireless-next v2 1/2] wifi: wfx: fix possible device hang during
 init
Date: Tue, 01 Sep 2026 12:02:31 +0200
Message-ID: <3436936.44csPzL39Z@nb0018864>
Organization: Silicon Labs
In-Reply-To: <20260901085012.21B011F000E9@smtp.kernel.org>
References:
 <20260901083548.113131-1-jerome.pouiller@silabs.com>
 <20260901083548.113131-2-jerome.pouiller@silabs.com>
 <20260901085012.21B011F000E9@smtp.kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::14) To IA1PR11MB7773.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7773:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3a2e00-b18b-4b44-374e-08df0810255b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|23010399003|376014|6133799003|18002099003|22082099003|56012099006|10067099003|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	/i8hTCxtQy88FlIozNV0dqLIwPWg9QdNYShG1doNGniHP1VRNa9eO9Ku/yoKoCLR2TzPJPiVfrzZBqnO9R9y081x5gjn0F8eesyFMySj/OF0aV7ORfWTGd2PeP+RNYwiTh0sFP0CndzOtF3THVGdtZZ5WBmfkrqdZY3mzk18FdBH24GmMeZJ/8Ezo7ZbL4wggRvu/hP7cXI6z3WI1Sa4bxKjK3JVj7m9W9Y6hYf9lSL8MwQWO90PmOYSzlrYaUGibyvjQb6yFsC/7MiVdXJU0gjorPggTSzE9fWJAXghctK9NEHijpI9LN9YRMAQAb+Yc/1u+JEzRGGSWTUwdCyikbYS7IjrrzdF1GLpghVtL9TvgI1fZPaLjgR9cWTPp6Ms+943Eumkd9evI7RO4yxzU2Hm+d6RQTGt5sR/84tM8fRctDq6jwOgZcGTGwiUOwCgDsWPNKnGgS3vJlZP9h83inH5EH9MEGpJyyZUPnGOqgl1k6XHW5oahA7L35FTL+JkHZ3CGZA73FGNKSwIBR+wxVFzF2pYKBxRvbok5QK6slLq8ae9gFT6lxikOsaO0IqQoezNaJENRZ4aEpnE3Mz8LftwIOIFvRPbAEOw8uEJkzCkA313ClQJTYq1/ia3emkQht6W7uSnqEHcwIsapr09NllJRckTJw7v7yrPh+lQ66Wq1HULvzmKlbonKXk/1LMKdY9bL/1Z/p/nD7OBOAB9EpLMlghdVB8kN/43pAi0XxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(23010399003)(376014)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STBLeUlyb2E2a3p3R3M0N2RKSEh6VWRiNDVZU055SjNteGNEdGo5U3NYUUZ1?=
 =?utf-8?B?Yyt2TVp4ampyL0xCMGdnQU1CZ2xuYjAxc3NRZDJPVjVVOEg4aXVkWFJrUGZ1?=
 =?utf-8?B?c1kycE9CRHFxcStka3JjeCtDSmtZYm4vMkQ0bGxtTE8zeVNrQVU3ckd6RlpC?=
 =?utf-8?B?bUNhSlpzRDBOQUNWOVExckR1V0o2WXJ5dVZBcVpEWWtHQkU2dGhXQWNWQWt3?=
 =?utf-8?B?ZG9PelpjaVNpUWVjcnl6dmF6OWhFU1c5amZweTFsWkRJM2lXYzk1aWxJK1Ev?=
 =?utf-8?B?UzZxNGt2c3RxSDlQcDFYaTRZZ09yaElIQnVWZDdpdGtaejIvOEdsd2IzMHFU?=
 =?utf-8?B?VVF0QkJGRmsyT013cURoK29MUmZwbDhNVmRsTlhHd2l3RDFWMERScUZ0R0p1?=
 =?utf-8?B?dlgwMVNwN1JmSDk2Q1pQU3A5NFVKeVZGM1BXQmQ0dWIzZEJWWndPMEYrRVJW?=
 =?utf-8?B?aVRaNXBUM1VMcnVNY3cwVXlialJmZ0tnQ3JEM3krSlZNemVzem1uL0srSk92?=
 =?utf-8?B?aXpFWFp6bG9sRjRYU2k4am8rOEJXdmpLcFRoR0VwYXJ4SFZGQy9HUjJzNnlL?=
 =?utf-8?B?cm5VWmN0d0M1NUNQdURzampVSmhUcnhxMHpkT0ZxV0djTFJUUnJZYmN1Ymoz?=
 =?utf-8?B?V1BOeVRCUjdzUitSQjJEem5hdGYwdklTWVJvYnRNQklCRUFGNW8xMVJHYTh6?=
 =?utf-8?B?THRheXNqcktwN1doNWxqV0dBNnNYaWMzNDFIbFgwMXZCa0dVYWZDc1dnQThE?=
 =?utf-8?B?cnA4NnFGSVQ4dHlFT1ZyK2xsVWN2Ny9YVG85dmhCYzUxTm9Kak5IcFAwNjNx?=
 =?utf-8?B?OVZBN0hFOUpyTTM0eFVLa2NvL29pbmxoaFNwNFZBNVVYZDc3WlFZZG1DTTZm?=
 =?utf-8?B?Sk51UTJzR1draFJtbkExRDVCRGIzVG9kbzkzRWJoQ2JLWmlnWVhNa05IV0xZ?=
 =?utf-8?B?VHZwR2ppNlVoYitUYXNCbkV3UXZGemEzcWdPR29pQlhEL2laRFUweVpNelhS?=
 =?utf-8?B?ZmUwUXZBUGcrTm1zaUJEZ2JZbDRramFHUDNNV1VsQnZBWndnaWM0aFNyTlhM?=
 =?utf-8?B?RjBUOHc0bVltUDhjY3BvMy9Ob1ZmVm1CRmw3QUVuOVZ0TDI5amZaQnp5R01k?=
 =?utf-8?B?a2kyZmpHY2owS0JlNk5ac3pORkdlV1pSWm5kdldSOHdTVTRaK2x4aGdmZDJt?=
 =?utf-8?B?bmQrWDRMV01pY1dJZnEvQW5SYXAvT2M4N3ZsR1Nhd0ZnOWR0SWZwNVQ4SnF1?=
 =?utf-8?B?bWMzbEhIVkk5b3RhWVd5aW8wSXBsTXVKNkpxWEJkWWU3UmFRdXhwSktIQ01Y?=
 =?utf-8?B?aDBpbDFXd2dUa29WK0Qwa3h3Qy9jODI4SkJWbWMrS3djWCtBTzhPd0tjaEtN?=
 =?utf-8?B?SUFHanpWOUppeFJMQ2FlSXJWaUNlSTAzQUJ0Ukg2dXEwUDR4VWVUb3VzRHg2?=
 =?utf-8?B?QlVpNGExelNWUFpNeFJrNmZNZU0wR3hsYURoYjE1SEhEeDhWbm9ieVZacyty?=
 =?utf-8?B?OUpWOSs1andiL1RxeWgrUVRpWXVEMnJoYkF3dUhWbVp0SlFYWmFZWVJzaUU3?=
 =?utf-8?B?TzN1TDFtRmFjbVVKdm5vU2FPaHA5R1BTcWpMSFBTYjdPWk1TeDU3NlI0UWRx?=
 =?utf-8?B?QW9XM3c3T0N5VUMwQU5YeFlRYnZJZ3B4cTg0N0xDU1NBMnpEaWVIRzJLSS9z?=
 =?utf-8?B?T1N5OGY1MDhHSkplcXZVbXZFZ2Z3SHBEcERFaVg1Zjd5K2tKdW0zTkcrVmlJ?=
 =?utf-8?B?SVd5dHJmNXNMb3d2S0NjYXNNMGp4UlV1b3IrVGZMS1ViZ21SRDBHWHFDWUVV?=
 =?utf-8?B?a2pGeHhYb21HS0hLa1I3eGFhd2t2djRxQUZma244ZWFES1FFMkpnUWY1QjZi?=
 =?utf-8?B?Q0JzYmgwSW1DMEJya0wzekFvcjhicmh2dTA5bkJkVmJrUFYwdWg1ZDMwTk1T?=
 =?utf-8?B?SkxKaC9uZkhtb0FqZDNOVUIvTk54aVMyeDAwY3k4OHdKS3FmdlVrNFlsNE43?=
 =?utf-8?B?dnphMk15Z1g2SE5vRGRoaGhnVmhxdEw4NGNJeEdyYW44enFpU0YrN2pWbWFw?=
 =?utf-8?B?aHo0RytTYXRqaDFMZ2lvOHQzdzNkSFl6akU3cXRDMTNUYyswQStvU1IzSVhh?=
 =?utf-8?B?aGZGQlVmS0c2SCtOWG1XREx4U1RvbTNtUllOQjVuOTljbmJLTGQ1aVk3R3RO?=
 =?utf-8?B?MmFFUWJHSEt0QkhXWndiWXFvUHRQSjgzMUJEZ25BaVcyenZ2TXErR2VkRkwy?=
 =?utf-8?B?TjBwNms3VU5NSXorZkp0dTZQeEoybkJobFlmWk9IcFJ6VWphbkZaYlFBaDBE?=
 =?utf-8?B?VXBBZm44a0tEL1lRUEF2bVVTK1lZT05obE9VQzRNZFphZ3llbW9IZz09?=
X-Exchange-RoutingPolicyChecked:
	BaDwK502mg5izzMJNb3qcUSC4358oCJkA1FvehXxze1tYUE2+zcNZLhdp2Ztxt9+mF6aImXNebM57HMkZi4VkwWcuwgbesNYE6zch+viGBRbMqNUw1xfq1AHxe3q/QRwwmS29hv4sFb1hmxQknhb0OrWJn/QdHaCnOGtumIRQhMZtA48nX//1QhPWcHyN8zL3PaIOPWMcw6rPp0eNqmUdeWA+jXcYnTR77OfQGk9dSZ9SRhuFhNQUF4HboaoZ9BQecjnNatzwlUoOdUcxLgoAd5/xDt4VBOyrxjhmu9rrm7j50+Rur+LdjC4PzsCI560m6ndq3LS0qJfeMKLGXhPDA==
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3a2e00-b18b-4b44-374e-08df0810255b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 10:02:35.0831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Tu94wrZ5PwKlEgHOfijvNLm/Zr/QhCTaShLMxhNkPXH1jQbm5Ufn/p5k6O+d2UTu3EA8EEiidUecOeq65Ms7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4OSBTYWx0ZWRfX3sZlzIKwFfin
 lXtX+50pyI+szkSC/tvcNjHgg6n9OOgM0V+/udLq4DdlTw1AuJ085i6Bnu6yscaIJmlsPlNIDv0
 N4953Vc+e5SPA+Pl20gnCh2HZKOCGCE=
X-Proofpoint-ORIG-GUID: hGDI1xeyeDiHelqGsylU_VLOkO9Surw3
X-Proofpoint-GUID: hGDI1xeyeDiHelqGsylU_VLOkO9Surw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4OSBTYWx0ZWRfX+7yy8AtwLtnR
 k0dSFPwWd2390BhtWW+GzKamPNmtnFXB09tWoPJT9r5Ypmlq0VK+ACqC45R+6H2l1XdZAv9kyYE
 hUWoTqUlc5TS2gRTTGZriPCrdslclHcWAuzeUFj920tKcujNs5RP56BAhAZ5XQiX7T1xqX9tvk3
 2C/7mz15l9SA+EKCLG8skuz/0Hs+jt+Fb1PF8KoOxb2KDvJn936zoJElLvEV+qR3jw5R2WpNMYV
 9sMh+TFk3JLqG0wQFRDvoWqp8rmb7xzIaQ5mTHzxO3IMRbL2RRfoTF2bWHJDCMJCaFqlTlISGWA
 QN3NBITnv+Q/BsuHJa6qkzXhXmql2JSP+x9fiyT1wdqN3hR9sVua+npNqilGwPF7sjRKAUHtZmm
 9gcdwvjLXf67R7QTcLxyXIQ62c/N620R1s0NVO1u1QrVAGL2vNC/APhi/z8o3j86LW4loWtzauy
 LwFBoEQqqwzNu1A04Lw==
X-Authority-Analysis: v=2.4 cv=UIHt2ify c=1 sm=1 tr=0 ts=6a96a2bf cx=c_pps
 a=ucmUxximRHcyFXWH+Z14eQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=i1IsUcr2s-wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gIHJBl62Mt9vjvfn7G3b:22
 a=6KgOrB_2K63Cyhqxo4vW:22 a=VwQbUJbxAAAA:8 a=2AEO0YjSAAAA:8
 a=D_z706dXaJR47Cav3Q4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010089

On Tuesday 1 September 2026 10:50:11 Central European Summer Time sashiko-b=
ot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Uncanceled delayed work triggers Use-After-Free.
> --
>=20
> commit 0e92ce2797177a88d76cee72478042230234d0a4
> Author: J=C3=A9r=C3=B4me Pouiller <jerome.pouiller@silabs.com>
>=20
> wifi: wfx: fix possible device hang during init
>=20
> This commit fixes a device hang by limiting the use of the data polling
> mechanism to out-of-band SDIO IRQs. For in-band IRQs and SPI, the IRQ is
> now subscribed before the first hardware exchange, avoiding the polling
> workaround entirely.
>=20
> > diff --git a/drivers/net/wireless/silabs/wfx/main.c b/drivers/net/wirel=
ess/silabs/wfx/main.c
> > index dda36e41eed13..4e99fe7e5bb78 100644
> > --- a/drivers/net/wireless/silabs/wfx/main.c
> > +++ b/drivers/net/wireless/silabs/wfx/main.c
>=20
> [ ... ]
>=20
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential use-after-free in=
 the
> driver cleanup path. When the device enters a high temperature state,
> wfx_suspend_hot_dev() schedules cooling_timeout_work on the system workqu=
eue
> with a 10-second delay.
>=20
> If the driver is unloaded or the device is removed before this timer expi=
res,
> the devres callback wfx_free_common() frees the wdev structure without
> canceling the pending work:
>=20
> drivers/net/wireless/silabs/wfx/main.c:wfx_free_common() {
>     ...
>     ieee80211_free_hw(wdev->hw);
>     ...
> }
>=20
> Does the cleanup path need a call to cancel_delayed_work_sync() for
> wdev->cooling_timeout_work to prevent the delayed work from dereferencing
> the freed wdev pointer when it eventually executes?

To avoid confusion in reviews, I will fix that issue in another PR.


--=20
J=C3=A9r=C3=B4me Pouiller


