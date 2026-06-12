Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E923148DA
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781294363; cv=fail; b=eHS9SmKOb2ET8hlhXDsqt2uLLJTepTJxOUZM9vkIvo4Jr+ZzJT8Jq319bJLRAWu9x23NG8712NEI/K8CvKhGPlNMg3qAPvNVq9AKIh3C7aT6qG88sw0+i0j6VlmhAYjw+ipNBDh0D4I42pDCd+xIIPp01MnMDlNfLJcP4MYH56U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781294363; c=relaxed/simple;
	bh=izHPH0dl6GYcdvjsDU9MuaLGcMeusS1f+Lz5jC0Y6w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k+CvjsbNijBHAlB+d5RqL4v5391A3FGbyPARc6M9+ungcB9eN6bl2tEgETxLMD9T216q367yRMOYuXbFhdxzmdCttHlppHJEBGIruzcDdSBzGrGxeovsE1WtuObMaXRgnVjdjg9VJnR5KZUWvgsHzPRoG0FPvWdwSvrjwxGoqrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cWui8usv reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cWui8usv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekaCOSmxRd+aoBE/7JqlVnntNUwh5UuNavPjWKzUaKtXM2Pbtd+NJtlj/aUHDMg4CODQa1PctVyPRD/gUB8xDRltILlQffBQJdEXC4T4Lz3T3qnxreAVjwlk683Ze6WoNroyYGHl/ioxjXr/jrtTjWpB7Nnbv93XhP0jSaBWOWZ9tHOdK8VylSnnvBxPrzOiDOuiPsijcuRsFKYIJvecNlqhKHHLbg8uDTGbIlySyxwioN6cokxxelJHuxczgTLhscaZH3l6dGs3Lb6ctLcx2FbfEBGpyDP9tpjtfN6hOeQS/xlN1454G2W5iOB/Dh6lT9BcfbVtMpqtabjBPJddfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ24KEly2MI4qVAYjOT/dEEB8iDyhRL6o8Ks4IsuAmI=;
 b=T2fkbmDgwFy2uQ80btQb6R7PrYirX7sqOOS8WOK01RHCDth/LlQyexm6ZrCDQpwlnKd1zIWFZLhb9Ifz+4P3a2S41UtA/7j0e9mkbTfLJ7F6zOwl7yp2PVRcl4c3SbIceNPqD4KJtlzCLZYVL57jtQExpqEC7H8BaO5KfG5IAEhKwUdp5PwC2qHd04lJRNDGRlayWnNqjqpGWhjPGlShrjccGwmEzgOzmTRYQ3iOo/7TDTYKGFsRros3pu11HX/fPQ/dg1sM6ImQOMIjgmBZExvxCgVD+P1Nc7YwYn79qbKLiG8pLYfxmd4v3mZnsth9ka6R9LAlN73n6RaUnJIu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ24KEly2MI4qVAYjOT/dEEB8iDyhRL6o8Ks4IsuAmI=;
 b=cWui8usvTtP6tw/PPiw4pfm4FAUrMJvYFLpAl/9h/SpaCHoQda8UwZtCopvdPy14Sb6Fs7C7I4IrrUlwtR16FDVntiSQrfSjvneVsIB9pazwqDnljsRxLIB7FwzhpODR50Y3BxnlYioqde+8DqxHhn1SzLWU5IoCPPDvWaGPBU/+zgpjjoc+d/NnZMe0jI07dcAAfgKs3ZzOD2oATj+MNUxkVkfEAWcpIkY1poJA0DkeAx/mECxoY1vlkyvAiGFbr/K7vFBVlhI/zmY2X6CHO0J6VkehTi3Bw1bcHQoyaSk+kV4ZlbG+RQyj+NEVx4WoByd152AGWcKN1h/Kpih0YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB8013.eurprd04.prod.outlook.com (2603:10a6:102:c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 19:59:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:59:18 +0000
Date: Fri, 12 Jun 2026 15:59:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH v11 3/9] i3c: master: Add APIs for I3C hub support
Message-ID: <aixlD3OTAhdVP12-@lizhi-Precision-Tower-5810>
References: <20260612111816.3688240-4-lakshay.piplani@nxp.com>
 <20260612114844.5D7B71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612114844.5D7B71F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0051.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e0936f-f8a8-4760-cffd-08dec8bd168a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	sg3m44hmBNBSviryQX/WZr0K6WxVKO+9RnXlqxaX3/Al5VnsmW3P+q5FuAkLQJzrQYQ+Xvssrmdn9VbC/zeT8+BAF599xNB4AnGbu7SJQiCC8TfF7nGYDNBMrVXMw/PXCnV2PpRg+1LCRgevAIwDE6qh58KUytjCsJHgqzvMRjP8FPq/lm8r2ZWWlZ1uxOTWBBo0LNo7Wpj7Pz+J+Gn/Bi8Bxg85j7cnCONUuzy8wjL0oIhhfHRuGg7ZlXo1fUIDGg3Cp3MsG0g2+r7otREo4ZdAF6InKf6X8LM5iqGchYo6hOQ31gpJ3n8WpkfB2qDPWBmkPDD3f2hPf02dDFZy6xS3WxkkRt/j4rHcDXHEn8S57SUFT7R9MAvjWj/EdcBDCIJFTO+uPCPrk7bl5iWh21FEApHcTecnlUs1+5ujoLmTC9TM3Q+ujxaQ8L7oJ3/7/RU7M3aY8e/aeplAG4SJ8EnhRsw5IWN7oQP8U+dxHQD9la77yCPDsbuwdjM1mhkexBGKN6m2PVFGUk2OdxTfT0ROkO3e7kWHT47IQp38ZnX1W0MqIL1yqjKrDiG7LMD0v1ilFOSi9I99P4QrtPchjfstqdvQ2qmsSLTifk6FQtqYTp9KCZ/1rVwCvkEGgTX4cI9k9uIcNQ7cCq0sDT4WQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?BsElhB/DuZafM1JLLiKGUP1jpNJtMJBH1dnd/PPZJ7r0aa+TxubvB+2D/s?=
 =?iso-8859-1?Q?QVVeVGxyJuE0gwQjDS4emw3F/kkripQpPHPAsFl4UQX5LTEBQg+H8GGAWN?=
 =?iso-8859-1?Q?vFU2OD6du4l+XIfFdA0GRyfzpK0iZ7v+mtYXxzgkfURLcMUcSgcr5BvXf/?=
 =?iso-8859-1?Q?oHsl556+Gy9O0MtSp387w2z4S4f0EN48uEJgNZXkzEFbgM86O5348WNtzF?=
 =?iso-8859-1?Q?GeAvLcqntYuhpJSh8oJbjFCVSxcFizE1uG13TBx/iRY7hPKEvuOo93HZGv?=
 =?iso-8859-1?Q?fc7FZDejKVVvnexvR6a7TQhEk8Mju7+/CjgA1NCE2V8g9XBJYNnzdj3waS?=
 =?iso-8859-1?Q?Cj66JhtlNTNB0n7lDZ3R/w+G/+7trhcU5rSiOlF42vCjKm519P1ZZ5BZyq?=
 =?iso-8859-1?Q?to4OqzRD82QZV2PySfCNER6zWXD+sMfqYmPdLe2HdQqfWMGXS2SIlhH8SA?=
 =?iso-8859-1?Q?X7QiVhCYnMKNCi0KcSRWEh5lBzFkIRSlwhCXObl2YoQ8q2YGffEOkdtj+S?=
 =?iso-8859-1?Q?O2c2Nef/kZSKIEGVfXz0ChZVnOFvswF1MxqZsS8ictouj62OtClgOLvOa9?=
 =?iso-8859-1?Q?iEF7VbWarXzPMZQguu7k/ciXKV0DMPUsgRiTRBLwPV4zXqTW4aurDQfl4i?=
 =?iso-8859-1?Q?V4WJPypUy5fU9KITmGmfQUF5TLVGdMseoTG/IBRh+SMnNA6wyUaflgweWR?=
 =?iso-8859-1?Q?8NIn5OJ2qAQ8xJ6omj6vlvfYeyW5XWsow/pWVKm/JURbPb5Gz7jKU28OmQ?=
 =?iso-8859-1?Q?/fHJKD0euFmr+zSK8dYFzuOydtD18sX3Y7xe/Ezlgoo2Fv3oa8h0DouWoQ?=
 =?iso-8859-1?Q?09otoi8eR2q3jGLpRw758eXjP6T1bi/SbHV4VtoS/LtXq4w8glwtIdNVB1?=
 =?iso-8859-1?Q?4H4IORD4q9XsyEjnIx0zA4vryRNfnsRHk5IDAuh/iEuAYovUZIyXB3qL/U?=
 =?iso-8859-1?Q?XmJKwh+A+3ikTZY6fhvWwas656JRw1jSvX5If1MIjTraagKwIoHSTGbLpB?=
 =?iso-8859-1?Q?+9qTG2k0aTlQdQHC+9Q9L8GL+X4/PjOJllwR1Vc0+iSP/TYUCiU137F5Qw?=
 =?iso-8859-1?Q?RJ/3m73NML0AeNeHJv9GpfiNr0r7GTHElLsiX3hATlxrW9yVPjMRMHb7YA?=
 =?iso-8859-1?Q?cjQDgHvl4dCBGdWct9xb4CZuKjKuEktDJ2uZcrQcd/AbNyNvz2OKARwDis?=
 =?iso-8859-1?Q?AsERgHo5loj/UiCqjEmpkeLRF19URQL3myOjaArwcQJUmbHQmN/Ywb5shT?=
 =?iso-8859-1?Q?NtLKBKc6qTnitfY7nE6T754J9psPM6jH40LiD0nNM9aEI6foRDa9RLOix5?=
 =?iso-8859-1?Q?vCbi9qrOgd5ALX1mWE7rHwGPU12qp9dxOTFFvHOVAuyrcC8srcKMPQLRoC?=
 =?iso-8859-1?Q?CLcRRlFuGZw2kiLX3jqrQXqmngP7Oq2+lbOsM28TuKhMrvn+osMJHSHahj?=
 =?iso-8859-1?Q?HL5WChxhSxGDqyw9zClOOF0VqdIh5wOWxA8e21oCnWI97EgzvMK7S2STdO?=
 =?iso-8859-1?Q?H+a00sM7AzwRsyd8s5X+Fr8ZysnsO0I18opCJtnltIN1QsAoqWjjcHWTxl?=
 =?iso-8859-1?Q?giXg1BkgKTGyokG5GhqBCEm7ZqE27+V3fZyZAPzE+IEyuwgXiujUFA6MAx?=
 =?iso-8859-1?Q?gSmPQ49IcQANoGtcNdtMiGktF48TqxtPx5ZZ1SAQjC+6MrfgsSmWaiti9X?=
 =?iso-8859-1?Q?lmyXUY5oca2f/JNAbVNEyDYZ4jQHR92ZvpD34xfXCCFOJk9FnJQKOaq+c2?=
 =?iso-8859-1?Q?tgxCr0IWEqFSIWtu9/jObUS4U45P2KN9iwW9tlV7KY2V7frSVpdmUS2QT9?=
 =?iso-8859-1?Q?8RSYMfYkM/I11lLng8wQM/a17+A1lq9SU6eD0oI2AjV0RXfTtL8B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e0936f-f8a8-4760-cffd-08dec8bd168a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:59:18.7145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ou8qUo58eFC8mIo1eG9rd0eiMOYLa1XsdsoMYvnFFiH9HCz8eL9aSy9Lc3a4lKwJ2vUU5WNliCc4VlTCHXc8qGIRlmPW/AZSHu9FOmzV9omNETZQ2hlJpMUnEVoSAftB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8013

On Fri, Jun 12, 2026 at 11:48:43AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] i3c_master_direct_detach_i3c_dev_locked lacks the unaddressable device check present in its attach counterpart, leading to a NULL pointer dereference in controller drivers.
> --
>
> commit a7f74140d15672b8f2824666071ce06e3051e0d8
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Add APIs for I3C hub support
>
> Add helpers for attaching and detaching I3C devices and CCC helpers
> to check CCC support and send CCC commands to prepare for I3C hub support.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index ec3547f75469e..59e0f82de6ebd 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
> > +					    struct i3c_dev_desc *dev)
> > +{
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * We don't attach devices to the controller until they are
> > +	 * addressable on the bus.
> > +	 */
> > +
> > +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> > +		return 0;
> > +
> > +	/* Do not attach the master device itself. */
> > +	if (master->this != dev && master->ops->attach_i3c_dev)
> > +		ret = master->ops->attach_i3c_dev(dev);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
>
> [ ... ]
>
> > +void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> > +
> > +	/* Do not detach the master device itself. */
> > +	if (master->this != dev && master->ops->detach_i3c_dev)
> > +		master->ops->detach_i3c_dev(dev);
>
> [Severity: High]
> Does this missing address check in the detach helper lead to a NULL pointer
> dereference in controller drivers?
>
> The attach helper i3c_master_direct_attach_i3c_dev_locked() gracefully skips
> attaching devices without a static or dynamic address and returns 0 (success).
> Because it returns success, callers might naturally invoke this companion
> detach API during teardown for these same devices.
>
> However, since this helper lacks the corresponding address check, it
> unconditionally invokes the controller's detach callback. Controller drivers
> often retrieve the device's private data and immediately dereference it. Since
> the attach phase was skipped, this private data would be NULL.
>
> Should this function also check if the device has an address before calling
> the detach callback?

Make sense, please fix it.

Frank

>
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260612111816.3688240-1-lakshay.piplani@nxp.com?part=3
