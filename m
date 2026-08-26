Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A4389E1A
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763792; cv=fail; b=AvcJh1q+nCD/xoGYcQlSPtELXr90/vB7tNgguD4H5xZh3B6lPS5JNu143W47L+ISCcypkb1bKXMBZn7bBFsC69DcbR0sVez1floJ0Isu4j90vExWRIJGDyTskInDS7EOnk0FY+lTM4B0Ug00Q/rSfq1+eP7wqC9ZoZ/FA90wZ2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763792; c=relaxed/simple;
	bh=oZlGAcFvEsLCWHoSnZqq16n+CrOGwhRa6oZZ7WvIVtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qc2WNG7+IlDwmO9xS+ac/caPd4YpOKFxuYlHYk/b40Pk9R9iYNKuCdsRYfx3gt5gIlJSusrJLIixhwE12S3ytVWl477i3mB3FO249X/k+jFj7AoA7FSY5z0HA68R6G5p4MwSkQAyLQSuqLdoscWDL7Q1EF/t+FiSQlzaRL+AKjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ob9u+NdB reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ob9u+NdB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xriAw2P2I8TeAsR6wtDZYq3P6fnq+5NKXHluhS5pIHbWiaTdztRjPrcSRtZH351BQdkosHsykYPYDurBq7b1t8nAKJdHQ1NF5w3bFpKLU8nepiboHokMKw0kYqp6m7JeMVJ5NVjZBMuKaFL2W20yP/eo6zLpOD2BLxFrnBNnlZdNDGE6tkuMHLbUI5oF9fkmjSHzTc9xMhzHY5Qn004f6Mb3aEW9Tfk0HTtvKdFTyCvXiqAtFb3n9B9n4wwlSBAX09goHKlxgpEeKq7SfHD75nTKd5UC/PcO8NFHq8p2z8A7PlEa+Lr8cFhiyA7NT2XN0FgrKHniZ984bhj/bTRBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1agTrQ1EMQhbfoUw3uLoSQwjB09JKIdHxMnlK72o9A=;
 b=qL8+MnLSU4hzCDraPK4mw6dPqyeK7xRxTZ193KQJxL4hFRK55VIgfIGer4NdoZrK23O8WQ0j+y78CRXrXRWAS1eZNfQNJxxZsX/BltdDb1+OtoywgcctkbZOuYyiKHn5E1bad+LJtq9q4RLizO/JCRiuWHYup3MmaKUzza62Gr2UIW+oX1LUms2R5GaMdMqIAAWOi8gJwRK+VrDoe4w5iBK/I7bRk01c7Vm4719bqgJtAAUxxPuOm2PylH9MnUcGyHas7+rb9o0laWNv0389btEjHQkIO60bms+Vs+LF4RieQvJx9+M1CnmoSMLlCH7aQSmUWE4pjpFAX3Ub2jSlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1agTrQ1EMQhbfoUw3uLoSQwjB09JKIdHxMnlK72o9A=;
 b=ob9u+NdBvKFOREEDardfd4KB9y+WMusdj0ZkpFOIdxB+/afHLk26ppzwstS0Uwcc+XsjZ/9Tmy4L7ddlXoxUi3N0+HcL5neHkRAKTdjWMhgaTdMkZxblIjQb+0cf4WP3JU1Axh0cDxJqCv1ygXG8ByuVDEtfXoFPYXbxar8ZEzJapt9okhPiKQWRmh7zNLAL/mpBMI29RHD2YvulMKAY0NWjYffcmGsj9J0DVwinhHUtRgAQlcXjW7EYEI27wi7xrAD2RUGZkgjBS7wY/kCAifU6XIe01Qi/cttDowQE62dB9hA1OLWzL0vQ0gvG3UIEg6xAE/mNEsUjspkFCtmF6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by VI1PR04MB6941.eurprd04.prod.outlook.com
 (2603:10a6:803:12e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 17:02:51 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 17:02:51 +0000
Date: Wed, 26 Aug 2026 13:02:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v16 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <ao8cNDN1IeD8teUs@lizhi-Precision-Tower-5810>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-7-lakshay.piplani@nxp.com>
 <20260826110407.8FF461F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826110407.8FF461F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH5P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::14) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|VI1PR04MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 017ec154-141d-446d-2c54-08df0393dd02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|23010399003|11063799006|6133799003|4143699003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	x1BYw2iah+rsGphCiCwCLsh4r13z7YT6dNDrJcwE0pFUvXZUgkqtyTy2rGDmHI5fFc90wCJ90BxHHBLX3QOVEiewYnvm5IeWt3Qz0jh/YiUwb7qWp2Tn4P07YSff8M/85iSmUokwveDKERHbnM9W86fgae+fz0vEYy4O7q26YvrMD1JiBmWJguiQ5BjkMCNt6h/wIWxIyISIQOywSvaaKp0nX8h3uTOu7KYpxgXSSEReJxZcYYlvQ+I5LzQOgF8jg6UqG2o5TmsWpkmaezAsrbngI2oP+x49u1TaGy4zt7rONbsTUXp00h5LT2oIpGe/gZUP1hQ55yoqD881HkKqQfuyq8TVqkxtw2aZc99Tm32FNPo1EIa4ECQhqJCUBQbEz626NY298/vPWu2XDTg+wJXhiQikqe7rJFiT6aX87rF7ouBhmxXVSroEHBWt+Frnvifn4spzqcvKSDLfyzQKbeavSxiOQQtAqX70baEy8wxp5uIN4ZZctija5uPXylrO/GtWYCN2k+1LgbLT+F4Z8MKC/LVC4YTPM7VUpcRlKcEIi+eacgxoWdAq3K23l9XFmD/sWdC1bCCWTQm+pYgO5EiXwcgh9oHFW3a3q8t6ciM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(23010399003)(11063799006)(6133799003)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pA9FRA3DdJYBoAdPr54BhrZt27eI4ZpwZQCgO0XqMQ4jhcUwfNy25cize3?=
 =?iso-8859-1?Q?lxX0Z570AmxjhLD0TQSLZ1OxhWu9eXwA3VXJ7dNRAAfGDKpi3E1eBKlI2+?=
 =?iso-8859-1?Q?w/YlZ46kTeLOUg/iDxJVkk0s/mnQ/i5AFK4XZsyDlomeJ+TjFQnw0Dn9A3?=
 =?iso-8859-1?Q?vR/4Z/UUnqq6yvVH9eBG8KY1RJ6ahDAo2V3A68rsBK4gcXvjQGulsB5jwe?=
 =?iso-8859-1?Q?UjH3vOzB8iGT1hrWmbdyhlnejLVXw178GqgZL0POB2dHED8qZuvhYy/Hlj?=
 =?iso-8859-1?Q?5PlxUq0bvPOivQ5xLrQT9Kyg9BHfQPUHJAAFuRixl8D6RcTe6/+g2hcJvW?=
 =?iso-8859-1?Q?p3pa39t1wmshU+EvNhApTHMOgcmswJgvfDswDBPW+rN6Lx16uTD7qcZF6z?=
 =?iso-8859-1?Q?9FLjMLcqm60bz1pVD0c+fnDHf1w62LjrUUwEkiPMWFPowxQw+L9I8mF+uL?=
 =?iso-8859-1?Q?Wyeg2kuZ6VJs3+FV46PEAdNJRib7YXciVqHEy2/bTX/MVZmRqJBVuALAuR?=
 =?iso-8859-1?Q?1n2a9OV/umR+ehm6Q332jOVvUXPPhm9lOO3F0zeRyzctujmOIzFHR2S65i?=
 =?iso-8859-1?Q?rhp4hQWh83kktzFlhRP5ZMMZHh4BM046yHxpcXkIxTdlw4Q5aKkCrMPiAK?=
 =?iso-8859-1?Q?5+1zxSx9bZzEhruBk5AIy5FK05H3IbgQiJp78Y3D0oY7H1+fHzZYGtD7Zs?=
 =?iso-8859-1?Q?BBXgtRw+XD6lszm745e+0KhZm3OMf7/Ks7PcvtBE8/+IcBImuy+yZaBFtb?=
 =?iso-8859-1?Q?UccdE9ekdZqERwLI9SB6Ja/QULO8uFl9d2EM3hkp4VK5hiZ6kNHmmCGQyt?=
 =?iso-8859-1?Q?75Drbs+xx/7zJC182zImu8Y9DP1Gadpds+9of6XJ2BLNTk1idF9LoVDlw6?=
 =?iso-8859-1?Q?zeu+1mAuejgO56MWoX9C1WGW6Cy8lA6mN/DnHN5rGdNqxbQ+doBnENJmNV?=
 =?iso-8859-1?Q?UEYvWqMAYo4sDuwYnog2ZfhE8Ns9uL4RUR09C6AIAmCFE+AJpeu6mzBJ6O?=
 =?iso-8859-1?Q?YcMX4UUJti19Cx7Jr7pRrxzhhBlpWiwwWEytgwcIib0RpzWqd234dCWdNq?=
 =?iso-8859-1?Q?IrsUXlxF/MSaYmc/nvmdTrAP4uzli1Xugg5Q6SUd5DfjlO5Z3VeQe8YMLT?=
 =?iso-8859-1?Q?C4HkQgVL/vAiyna2Zl4r4zMmtwJdSYHlUtq8D9iwq+S0DqekGvzn7eUSIB?=
 =?iso-8859-1?Q?bcUF6gZqBMOEmpsrM513UC3njZh7V/GLg8JAlAycCzNprUffadgh0jgzkr?=
 =?iso-8859-1?Q?wOaqlC5n5gRwR+bIQnUGAk0QzYPpGWBQi6LU180HW86CU4b/JoNmsXn5hz?=
 =?iso-8859-1?Q?RCilEzmq6VrjKxn0VYoq7MKpIWO0KPsIf6jGUIxWrQbYravQkeDC3BAaB8?=
 =?iso-8859-1?Q?nrfiajY8jkDMyTuEg182XCDuev7S/GhBh0s1mXpfFLAUVVPqup9YT45PHh?=
 =?iso-8859-1?Q?JwIMLGgO+pl+SQz1Syf81z/COpOwJ8OMWz05zi4jLXM5iiIekyKiIOsFMF?=
 =?iso-8859-1?Q?O/FFSxPrxV2bjHtmsXrIHUAci7DCjgPx0pnKu8zUNKfSreSiQuNiL33n5A?=
 =?iso-8859-1?Q?6bd0l/kav1S4uHUh2h5CQKFxvxOd8zyV8AQYcTYjc0YTFv9eVObOV20I9v?=
 =?iso-8859-1?Q?XwxH86HewdXJ/ifWgPw1aIcvXT2aTa6E3NoXdAq06/BFBtA5TMSge8RV4O?=
 =?iso-8859-1?Q?wj8ca59s6IAp5UrMILJwhyxeHCNHI9ftJwnEEltAfUvScd05k7E6TjdKsl?=
 =?iso-8859-1?Q?LZFPFnvoQHP6oFYqFToxO0ftSLXGouwJ817IlZznmRb3Yixbh8WteV4jba?=
 =?iso-8859-1?Q?GYh2gmaWAkVJHIRD6uFe9Nen59LmkbUkcDjJ1CQnJZ4UvT82yV4j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017ec154-141d-446d-2c54-08df0393dd02
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 17:02:51.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBVr4TpM96MSaZbVaVY327DpRVLqDUldMXSs1Wn5wHupgNJn2Nbrqgj5Z5e1CZtl39Mn1p1U+ZOKYsfHW2bh7Ee9EB2mCcfXw/gMrZ6Wj584rPjGIJLPKhZ6ppWPYdGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941

On Wed, Aug 26, 2026 at 11:04:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] Freeing `i3c_hub_dev_data` while it may still be referenced by the parent controller's asynchronous IBI path leads to a Use-After-Free.
> - [High] Dynamic downstream devices discovered via DAA are erroneously registered to the parent controller's bus, making them completely unreachable for subsequent transfers on port-switching hubs.
> - [High] Reserved address slots on the parent bus are permanently leaked when the hub driver is removed.
> - [Medium] Forwarding broadcast CCCs to the parent controller breaks virtual bus isolation by unintentionally affecting the entire parent bus.
> --
>
> commit 94c62ce56dcc9d461749adc3db10a8061865dc9b
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
>
>     i3c: hub: Add support for the I3C interface in the I3C hub
>
>     Add virtual I3C bus support for the hub and provide interface to enable
>     or disable downstream ports.
>
> > diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> > new file mode 100644
> > index 0000000000000..6f5227215ae22
> > --- /dev/null
> > +++ b/drivers/i3c/hub.c
> > @@ -0,0 +1,798 @@
> [ ... ]
> > +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_hub_dev_data *data = i3c_dev_get_master_data(dev);
> > +	struct i3c_master_controller *parent;
> > +
> > +	if (!data)
> > +		return;
> > +
> > +	parent = i3c_dev_get_master(&data->parent_desc);
> > +
> > +	/*
> > +	 * parent_desc.ibi should already be cleared by i3c_hub_free_ibi()
> > +	 * before we get here. If it is still set, the kfree(data) below frees
> > +	 * a descriptor the parent controller can still reach via un-flushed
> > +	 * asynchronous IBI work (use-after-free, not just a leak).
> > +	 */
> > +	WARN_ON_ONCE(data->parent_desc.ibi);
> > +
> > +	if (parent) {
> > +		i3c_bus_maintenance_lock(&parent->bus);
> > +		i3c_master_detach_i3c_dev_controller_locked(&data->parent_desc);
> > +		i3c_bus_maintenance_unlock(&parent->bus);
> > +	}
> > +
> > +	i3c_dev_set_master_data(dev, NULL);
> > +	mutex_destroy(&data->parent_desc.ibi_lock);
> > +	kfree(data);
>
> [Severity: Critical]
> Does this code introduce a use-after-free when IBI is still active?
>
> If data->parent_desc.ibi is not NULL, as explicitly checked by the
> WARN_ON_ONCE, the parent controller's asynchronous IBI path may still
> have a work item queued referencing data->parent_desc. By unconditionally
> calling kfree(data), we allow the pending async work to dereference
> freed memory when it executes.
>
> > +}
> > +
> > +/**
> > + * i3c_hub_do_daa() - Perform DAA via hub port
> > + * @hub: Hub instance
> > + * @controller: Virtual controller for a hub port
> > + *
> > + * Enables the port connection, performs DAA on the parent controller,
> > + * then disables the connection.
> > + */
> > +static int i3c_hub_do_daa(struct i3c_hub *hub,
> > +			  struct i3c_master_controller *controller)
> > +{
> > +	struct i3c_master_controller *parent;
> > +	int ret;
> > +
> > +	if (!hub || !hub->hub_dev)
> > +		return -ENODEV;
> > +
> > +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	/*
> > +	 * Lock order: hub routing mutex before the parent bus lock (taken here
> > +	 * inside i3c_master_do_daa()). The depth-keyed lockdep classes above
> > +	 * keep this nesting acyclic when the parent is itself a hub.
> > +	 */
> > +	mutex_lock(&hub->lock);
> > +	i3c_hub_enable_port(controller);
> > +
> > +	/*
> > +	 * Downstream devices reachable through hub target-port routes share the
> > +	 * parent controller's I3C address space. The hub gates access to a
> > +	 * target-port network, but it does not create an independent dynamic
> > +	 * address domain per virtual bus.
> > +	 *
> > +	 * Run DAA on the parent controller so dynamic addresses remain unique
> > +	 * across all downstream devices, even when they are behind different
> > +	 * target ports.
> > +	 */
> > +	ret = i3c_master_do_daa(parent);
>
> [Severity: High]
> Does delegating DAA to the physical parent controller break reachability
> for downstream devices?
>
> When devices respond to ENTDAA, they are instantiated on the parent bus
> rather than the virtual bus. If drivers subsequently initiate transfers, they
> use the parent controller's transfer operations directly, bypassing the
> hub's i3c_hub_master_priv_xfers(). As a result, the hub target port is
> never enabled during the transfer, leaving these downstream devices
> permanently unreachable.

where reorder port, is it true?

>
> > +	i3c_hub_disable_port(controller);
> > +	mutex_unlock(&hub->lock);
> > +
> > +	return ret;
> > +}
> [ ... ]
> > +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> > +				struct i3c_master_controller *controller,
> > +				struct i3c_ccc_cmd *cmd)
> > +{
> > +	struct i3c_master_controller *parent;
> > +	int ret;
> > +
> > +	if (!hub || !hub->hub_dev)
> > +		return -ENODEV;
> > +
> > +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	mutex_lock(&hub->lock);
> > +	i3c_hub_enable_port(controller);
> > +	ret = i3c_master_send_ccc_cmd(parent, cmd);
>
> [Severity: Medium]
> Can forwarding unfiltered broadcast CCCs to the parent controller break
> virtual bus isolation?
>
> If a driver on a specific virtual bus issues broadcast commands (such as
> SETMRL, SETMWL, or ENEC), this forwards them to the parent controller which
> broadcasts them globally. This will unintentionally alter the configuration
> or event state of all peer devices on the parent bus and other open target
> ports.

Look like system design limiation, add comments here incase it happen.

>
> > +	i3c_hub_disable_port(controller);
> > +	mutex_unlock(&hub->lock);
> > +
> > +	return ret;
> > +}
> [ ... ]
> > +int i3c_hub_reserve_parent_addrslots_from_dt(struct i3c_hub_controller *hubc,
> > +					     struct device_node *node)
> > +{
> > +	struct i3c_master_controller *parent = hubc->parent;
> > +	enum i3c_addr_slot_status status;
> > +	u32 assigned_addr;
> > +	u32 reg[3];
> > +	int ret;
> > +
> > +	if (!parent || !node)
> > +		return -ENODEV;
> > +
> > +	for_each_available_child_of_node_scoped(node, child) {
> > +		/*
> > +		 * Only consider addressable bus nodes: a valid "reg" is
> > +		 * required to describe a device, but its static-address value
> > +		 * does not affect the reservation below.
> > +		 */
> > +		ret = of_property_read_variable_u32_array(child, "reg", reg, 1, 3);
> > +		if (ret < 0)
> > +			continue;
> > +
> > +		ret = of_property_read_u32(child, "assigned-address", &assigned_addr);
> > +		if (ret)
> > +			continue;
> > +
> > +		/* Skip nodes without a usable dynamic address. */
> > +		if (!assigned_addr || assigned_addr > I3C_MAX_ADDR)
> > +			continue;
> > +
> > +		i3c_bus_maintenance_lock(&parent->bus);
> > +		status = i3c_bus_get_addr_slot_status(&parent->bus,
> > +						      assigned_addr);
> > +		if (status == I3C_ADDR_SLOT_FREE)
> > +			i3c_bus_set_addr_slot_status(&parent->bus,
> > +						     assigned_addr,
> > +						     I3C_ADDR_SLOT_I3C_DEV);
>
> [Severity: High]
> Does this code permanently leak parent bus address slots when the hub driver
> is removed?
>
> The address slots in the parent bus state are set to I3C_ADDR_SLOT_I3C_DEV.
> However, there appears to be no corresponding teardown mechanism provided
> to revert these slots to I3C_ADDR_SLOT_FREE when the virtual controllers
> are destroyed or the hub driver is unbound. This leak can eventually exhaust
> the address space and cause failures for subsequent devices.

I suppose if hub have hotplug later, we have to reserver all static/assigned
address. Can you add comments here.

Thank you for great work, fixed the most problem.

Frank
>
> > +		i3c_bus_maintenance_unlock(&parent->bus);
> > +	}
> > +	return 0;
> > +}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260826103819.1614843-1-lakshay.piplani@nxp.com?part=6
