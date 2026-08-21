Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD70231830;
	Fri, 21 Aug 2026 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787292629; cv=fail; b=EH56djYGLobdWQn6g5QofWA4xaOGLzx+LJs9EP/gjf7DB0SiJFStb+AjvReATZJxNJxQI0+aw4jUwc6H6LxmWU2s2yca80Kqpj15ezNvoh3qS50Z5Y85VhLYylt4kNUoPmCKxgWLTb15boJLHi3vWDKT3lFYetRrjGCeBu/IiN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787292629; c=relaxed/simple;
	bh=ihA4hBmx83vj4/NrVr7dj3PrTDqF0fUwHyaCP3E1Bsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g5TF9dysN9fAATcEK4HHy0VfwW4DIHzp1v8ctN0GvW0oiho7E23QZ5Q67g5fy4F8HsMTHmrByG4ka1KsiDd12Jj/Zc3NHfL7slJpIu8epLtSRTn5UIVzetFdlC1bZM8qH+7mUl5qyRHWwxudyWlXVuKnFgBOH82B7HSN4C4Cssk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s5xKrex2; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s5xKrex2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEe28J79ZcPwz5jlahQXYQ+xVB5BJLbZATIrAfdjMnrBR4Izay32tPlz4hvBtJo4sTj1TirCMrC622e5KNj0BDC+fXmqdTvH2ymCGHhrSN7gkHi+KzYOYmCrDKMAdX1qOYCtEZwRCtVwnxj/mIAKRHWiduk0n/aipHOuyNxnzmwyDtlrQRHWDUby8h4D/x0Byv6r7a/Vj9SdupKvrHQxe7YNoQg3WFmy0cZ+JNqr6/wXLfotS4hlAIRf7w3kPCxeFrXUEYqiCRnAifugcLbk4PDpvotxNnf4NynjTSVWSP3inXcjK+3dPMp8a2m6kZ/e+penM3Qc+1yaznJGsvwX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ5o3a43dv5rEoj8dnLKZMUlz5ajzSpFKLhjTnhs21M=;
 b=bU2TTeZYYNPOOx+BPH4ZIyEA04WVcXWKqilxCwydlGIoizINd8vdN8YiACihvJ05jrl9IdWyrb8K+A7TafbWWn0A4uUmfnmkwct/ndD/9bUN5Pb46y8OYtibi8SeWk4ng08xGzWfyAvd0GSyS9+7e6NRMSu17aHTSj6pSVauMbbFr8y0KqDVLJCCNermnzttyQVxgP0N01YTrLIDFKEYCRsZsJI6wEhdoGyiYxs6wiAWNgndOzJS9JFhvtnzaB+Vlr9yve0RQabjfFfAT4XzOTHVSX1vEKyAMvmCnLkPZdTAYCHRyGCc3CuOmk/llnuSd+Xg4QDYwFzHhMW9zqybSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ5o3a43dv5rEoj8dnLKZMUlz5ajzSpFKLhjTnhs21M=;
 b=s5xKrex2JWboi24N3156n7o9sWuE3MNcBiQXRG9+MfLlue2GszxG/UPm5PfyBOSMDWoqXweRLTveKj59iEpjNieeLrKKCGfE1DWrA9jWW2x5Ovr0B81Lx1h1EsMvXyEWGdWlvr/PVdHQEq90egZGUYc0e6DavSc6IN+IihSNgZ9hATdsCe8HzdaN7SM2mSeHZaj+gF3i3O4UCvnCAaMMPTFymik6uqaYgtoqlbyDHDpNtxyAmBwBjRfaWAiulQhKr7xhDbXwXioEBK6aSN2hUlzCsLECfUrQ1l+r38FmnUVgcWJ/1CPfPbZN6HDXRb0UNwBWq0DjKMQY9CyONd7bbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI0PR04MB10903.eurprd04.prod.outlook.com (2603:10a6:800:265::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:10:22 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 06:10:22 +0000
Date: Fri, 21 Aug 2026 14:08:14 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mp-evk: enable CBTU02043 for USB
 Type-C orientation switch
Message-ID: <ptjibaymaq2spiww7b35xv5cvvwu5wlwdo2jchvizzxt3w5wpn@dwzph5kz2f4a>
References: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
 <20260819-imx8m-typec-v1-1-befc92ecb70a@nxp.com>
 <20260819150403.1303E1F000E9@smtp.kernel.org>
 <aoXM1M8bORem3yFJ@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoXM1M8bORem3yFJ@SMW015318>
X-ClientProxiedBy: AS4P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::7) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI0PR04MB10903:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de24552-ca37-4e17-013b-08deff4ae24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ivhi9Y9apUfWE/gIEaeZsuA/1wt8vv2Zzh5ouLu0ktuiY/T9N8AtKJ7xzR3z9Ib6/dxaHDM0FHF6gf6eoRFwcXK+Ssq14u+hWH+r4tCg79sWwyKtfKB2zcmFaQoU5cRBq/kiy8LRorc9Kqo++khpAZp80rlOFRdXYCWJJdfETeoZGJ15rQ+S4+hWkz9mg0d3BWvC9hQ2FWDfogifAsaCqH8gXT3EIjrox8MWzORN25U+QLjs765AA81HheNTdhkF8/GlbTkVv8hQzYWRTHhu1+EIUBeNafsYoSIuWw2+xAu3oT2kFqhc4pFxwGzscDDhC8II58INjdl/h4dGsfhk76xsTPvsrLBnOF7vRtfGB3uJhqUvaGJn7JFCL0oHO3bE5SIlpy4o+UtCsa+XkSsTfjb1HsuZFlYHiHoAtb0sRSWzbr5YMdQ8eFBMj9WzoVkOkcPyddWME4wTzbhBzK+dIQsyo1GHZAHTxB6Hz+1CTGyEe1+OOT6aqhjtPAd4t8gNH8xnfFc0eKeV7p2hLmTZGnB5IZ9m7LvrY4E93fBwARSzs6HfsBhgJVxQHvFwWJwJE7nJEQmhJ1fsHGsHP2/PeXsZHOrPDEhmpqC/t6SeKmBgC0uIPifTtk/lB55PB9p8T2GXjqrj2FglEl7c5yQnx50Klq7FSLsQQeo7ApiW+Rg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4tRntD17kNHojJkyglUY24qOFAYMRBC8bgheW7b4yEVHJBaFeAIsTIxq7tZE?=
 =?us-ascii?Q?B7K0uht2SBrv+kBojwFwGn6mlhkYLSZngaL/GMNVDcMWCixMPBeKsTfgPOYe?=
 =?us-ascii?Q?McZuuPOMH9hRiZ86FgdHkHRYbQ9ShSws98ZP4tb5ktrTAVvK2lYib9aDTi8Z?=
 =?us-ascii?Q?EtukYwGa9j+F8AmBqV9qDXrISD3yiN3R6mZMDpRlZwFiUtLQqQP4Dq/03upi?=
 =?us-ascii?Q?SxH6i92TQLigcGtRDwZeTH+RTxmml+t1erE/YTgK9+OaHJnxPi4dyFmOqX00?=
 =?us-ascii?Q?NZzKY8FzaldsvAG0jWFPwqOxugPEsJm3bN2gn8Rx0tTYkR5/LLs+OP9mTJUI?=
 =?us-ascii?Q?LdS90yGy4Cv8NCgM8iK200QLKXsjXHyuKU8YV9jJ7aGdak3Xf8NoSxWg39MG?=
 =?us-ascii?Q?wCEgB4wYtVOLJG5VF7V67v771RJRl2KSH2D7J7I/646odqUBKok5kKz30dpC?=
 =?us-ascii?Q?X7GaHO9DUz8pDKsy/plsLtNLnNmMWw7Rqzp+oUfXdcrXNgnS4euBdsXXXgv5?=
 =?us-ascii?Q?D6/p6VGkn4vWAD+TV1g0RtVbfGA+S12kT4CPbZnzCTIgfajV5emexjRJKwv3?=
 =?us-ascii?Q?RgPQ0C1F+I36QdDTwCQJnJ/WGe5WyTWEf3sWwWwbOBAhn1P8EL4nHcgSl+5y?=
 =?us-ascii?Q?nnQ3Ro/MnWRyoL2m48MGGlZOKN3gYtX+5GIHVisb+TueLjOUvhGbxbOMQrTP?=
 =?us-ascii?Q?48IYPrNbpJh60HQmbaUObgUjls4tag02UkoHX+OxHtebDGBRC+xdaqMVDG0W?=
 =?us-ascii?Q?IkqBUoAAaBGJqalWjIO8AW9mD7uDlS8xcCbDASyIdXb2Fwz73vLsi7Rb3LXB?=
 =?us-ascii?Q?vi+e5NoAfl66puk/pEEzAuOKEoyh92Dp5DgZuFNPda/g9AIKWq7wEPz2RfdL?=
 =?us-ascii?Q?+OUzxJ1QZ5AcVibuAwmGu0KyaBErgiYcO43Xz8oE3SUqE5kW/p00voVXGnGL?=
 =?us-ascii?Q?PMSJx6BzcUtIHODQBtEh7PpA1bbZdKpE0WPCg2a4cA5Hrex5gm/3Qb7G+VlT?=
 =?us-ascii?Q?DuBEymwPMaOyq+fj9pefNfu+AnlMCa/lllt9j1X8a1IlbHROAxwZzo8BjTWT?=
 =?us-ascii?Q?BFyh/Qedpxe1ejZvrqvscyyBrwdd6TZRkmslDKQrt23tWMhF+yBm3qjjS5/u?=
 =?us-ascii?Q?uprU6Q5SpD9NpNGpvFHZPWhuCxCqDYr4jKP72T1xniKsV767c++rPWzu18hs?=
 =?us-ascii?Q?pjhDRbvL5D+cmlJf2+FIUeynQW0ihMuwLsloK1+N9Yh98Pl+jN6pha/qMP8F?=
 =?us-ascii?Q?kSpCXf9iiTgDKI3uuZ1rATxLdSiPi314gLxftxE6GD4HBhCZVj/Ues02ZyOt?=
 =?us-ascii?Q?3C8OLtqf8I8GXaQjbHg8JGzaPL0Ae8DQKE7JNKzXtRSMSKYamkB2cAdIwpmr?=
 =?us-ascii?Q?sG71geb6I+PPULq5I4CAAJ8Dr0JkY0bCpLspW6tBpgAFMI56YYdM+Nq5u35x?=
 =?us-ascii?Q?fpNVficy45tAEWp4w8/vv1K5V8GWgyItVX6uODB+KsW6mZhQRS2NCi2OT9KH?=
 =?us-ascii?Q?QrgkDPmvPV/iymm2bUfIm780ZFgVy7Trge9P7XA4YXFmwiZaw+nSSs0ZAp83?=
 =?us-ascii?Q?Ha9dNMITEeZ8mCiHipV7iGaSlMd7x/mOwz3AKgi50zm6FH+PYgJazOuWQxNT?=
 =?us-ascii?Q?stzj1NbdlhSnVnR4nNYVO7J/ec0s+Lu4dUEvLMUEh9C2PB5DBkMIWgMr/67o?=
 =?us-ascii?Q?m9XEbFGbMnlDgsuHmE1qet8oF1WwAHw9mBvSC7+ot+q62CKoiRCwIB6HAcSm?=
 =?us-ascii?Q?XpgHq0cwqxpTNJWrEZqxhP3nrn8vFnRuhSaiIMztKaddB8cSCR/g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de24552-ca37-4e17-013b-08deff4ae24f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:10:22.7218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIRtmUdkgV0t0H67f0XeIVcQ1t5UOV9f40nUFXe2kkFWqq2acz3Y40pXGs4PoREN8HxylrI6jzhMXHmacyx4482xuIsCept9jmoTWKWF0JPmMhaZFLAqU914Qhu5fBaf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10903

On Wed, Aug 19, 2026 at 10:33:40AM -0500, Frank Li wrote:
> On Wed, Aug 19, 2026 at 03:04:02PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] The GPIO hog for the CBTU02043 XSD pin incorrectly drives the physical pin HIGH instead of LOW, placing the switch in shutdown mode.
> > - [High] The `pinctrl-names` and `pinctrl-0` properties inside the `gpio-hog` child node will be silently ignored by the `pinctrl` core.
> > --
> 
> both look likes make sense.

I just tested the patch on i.MX8MP EVK. Yes, CBTU02043 XSD pin is always high level
and SuperSpeed USB device can only be detected as High-speed.

Thanks,
Xu Yang
