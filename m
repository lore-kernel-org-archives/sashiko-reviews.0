Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023099.outbound.protection.outlook.com [40.107.44.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9AA357D17
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258766; cv=fail; b=dX3Tp5XIaSIbpy6ydQpT3AZU0WaiF5v624hPvD6LxjJUkDExue9m+eMFExp/t3pu4AicnuMeRzmIGTYpx38jf+y6nOVqWc6kRM86bq67OgngELnvplZe6+fHhESfOWTE1GzFunjPdbUhM7Hde9JtlR2GDAN1wH7DhF6kIbro8ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258766; c=relaxed/simple;
	bh=8R0vPbalcDBdZtnzF1t5aU4VGSsKk5lyStsTqkuuUzU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cLD5q2vKeq6e/QGyJTaOl4znXjAmNgjvB3Z1joAD9CVqhuD1Z+BDJokk8ftE8ovOc0z8dMJm3W/mUXe/UCgBpFdCxc0tQ/aaw9LGDDjXtZY8ifPj94D7HoZW/SS0eH5voyJaOTQq8EXyamQeLv8P4Sg+Z93E938BDDmR8JcCjWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=VEKZ74W2; arc=fail smtp.client-ip=40.107.44.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="VEKZ74W2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRF+SBmYV0nHeG6b/R2NDEot2WpTpvEipaMXbDxpvvuThtLlwfvhAWobo1m8jOjsiEO7vmbKcRrRDLWB397Amfous43jR3C/8bRUCpu1YMJgbYtUCAK9q4bMew3XA6KidOiDUfxkt2NWQA1EQkakIfU2e6HwK5N0o9vSo8y1IIorcz0NclH5SIk3vUzeZRHxLJ0EexVMtW3f8vtB28jBZARRh3/Jt4yIetQ0rOTVuxj7D18DhP8EGKRSb+s26ec9Lrt5PTULtLHLkiQ5euzQ4ILq2KjNcOmSMfmDwR+p5kvZZuYsfqOLyuIJ3ETi+wi2y8W93WFAqGMusNqStFe5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=lh/WZVFrdiMFuo2ig+H0GWKH7CVk8Xy5cF6e6EkqPbM=;
 b=jiKUtXZRevEOZsRgd5rjjpHwA14z1cMybBstrSXaik7HGzi2uIKHJolRNH1V64bEn7m4HE+8hpT3g0AsMTicPBbpempWReL98Ru3NX7Wnwak9pfJgDHHjb9ixqUFjY4Ji2kqXBcDmoigcV1/wUVqV2vDqVztNurMIrA87ezN8suAFvOJWiR2Z9who1MTK4MiWUExprskVDql13YdotaEQyLhy8zsQai59sAmHpng08WtqiDH/DR1T3BTZj5LxOgenlTW27yISBMF1fhbfVZY5l8l0jRyvFZRHOvLS72BP1dIk4dXhZ64JNHjdwf4fMhgppc53Ab1z0OXLX9kvNsSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh/WZVFrdiMFuo2ig+H0GWKH7CVk8Xy5cF6e6EkqPbM=;
 b=VEKZ74W2EVwlldnlzutXvp5KyAPclCWnwulOsrPukE+wA7ZqwSMpj+Q24oxgoTSaJOs3v70xi3wo9exyDPr67juTUrdoCSLb1ziXy2Mw4C75VCSP3APlTqUEQ4EK0GcDUrGAUgBCxZAwvhNUvl9hXKmP2oBwHEYf4kW4AG/mpfg=
Received: from SE3P153MB1848.APCP153.PROD.OUTLOOK.COM (2603:1096:101:340::5)
 by TY8P153MB2253.APCP153.PROD.OUTLOOK.COM (2603:1096:405:3a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.1; Tue, 1 Sep 2026
 10:32:39 +0000
Received: from SE3P153MB1848.APCP153.PROD.OUTLOOK.COM
 ([fe80::8f4e:575a:4706:a56e]) by SE3P153MB1848.APCP153.PROD.OUTLOOK.COM
 ([fe80::8f4e:575a:4706:a56e%6]) with mapi id 15.21.0406.000; Tue, 1 Sep 2026
 10:32:39 +0000
From: Wei Hu <weh@microsoft.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Subject: RE: [EXTERNAL] Re: [PATCH v4 1/9] mshv: retain memory regions until
 unmap succeeds
Thread-Topic: [EXTERNAL] Re: [PATCH v4 1/9] mshv: retain memory regions until
 unmap succeeds
Thread-Index: AQHdOTu4R+/xS9EwSESkMqwOvvTIura4CtSAgAF7OiA=
Date: Tue, 1 Sep 2026 10:32:38 +0000
Message-ID:
 <SE3P153MB184847E30FE5E21EB9448A11BBA82@SE3P153MB1848.APCP153.PROD.OUTLOOK.COM>
References: <20260825040505.826600-1-weh@linux.microsoft.com>
 <20260831112704.2851147-1-weh@linux.microsoft.com>
 <20260831112704.2851147-2-weh@linux.microsoft.com>
 <20260831114834.586961F000E9@smtp.kernel.org>
In-Reply-To: <20260831114834.586961F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=2fa259da-4692-4962-a524-5e51c50bf8ac;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-09-01T10:25:51Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE3P153MB1848:EE_|TY8P153MB2253:EE_
x-ms-office365-filtering-correlation-id: 84372d05-1a3d-4a26-dd56-08df08145897
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|23010399003|366016|376014|1800799024|7146999003|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|4133799003|38070700021;
x-microsoft-antispam-message-info:
 +YYCQvPH0nNvDW9ewv/RCWwgdq+wM0ZnG42S6OI2UQaj5epiv7RXp35m5rPwpdfbh9SJg4cQmZr9V0AzOkvEtoAoUL8q2Y9jnB9r+C73qfZE8trdD3wr7V34u52NOSdWQ8g0/QsEnY8C+iVXv4aIxRjtAayI/04AR94qKhwQ5PBEbhTo5SIf8tA9GWVrFSrRqFjFg6+9MifohFM0UTnFFAQLYt+aSWFD1xcRf+cZpd+xeUZHHYbKl+7xPoD7HPx6CIe/ldDffnCvAbHTxJZ8PbsFwgiHdTU4qvs2zKfTqr0sH6ZFz24xVn8HUbxfyYUTfUEpeDnjoJ+oesosvqMil6TVR/Al62oYt1nS4UxJ8s4uTy8U1KI5d234DLx/Ri85V6JCok9GkO5Dq8Qzf74FrvcYDXI1I5AzEwdLJI5jrhmyjOiHKdGSiTuEoO54n7TRiMJvJx4gE4RZnjRVCYb+SIeotkl9ZFxdWAFhnuozYHHVPPvuhERzbJWNfWvgTcNN+U6g0NB/n9SxNflQ8s3CisYWHF/Xzc5Vhjge0a4vsf1NHV1MbkLjjjLSZ0qnOiZ/eAAB8AxkgOkgLkSmu44D+FJ80z10YVOVTO6tLtl4W32jD2p23iHslAEREfc4eHqYfqR3tiad6zZNRWwEe9MZj8LvJt2SCZV25okdLN6QVXE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE3P153MB1848.APCP153.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(23010399003)(366016)(376014)(1800799024)(7146999003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(4133799003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c95Fa2mqeuIll50ce4pvtDJXcfvT/ZMqZ2hkPlENP3uyHqQmcpwi6PY7dz8f?=
 =?us-ascii?Q?otFT3JGZA3rySho/ZmFNgFIPQhGluvqmYJwz/RIuXm7zd6sdO4hI5BYbgI/X?=
 =?us-ascii?Q?+X4R89gstOkb4XuOc7EAuEDTpZMha/e7vN0VbkunzV4X72072urg+6DTFCho?=
 =?us-ascii?Q?cma+FuBJuwNy0OIeZnWI4kmU8F+LK1CVjl2MvDE/PClUy9/pfOiYDNiI18i1?=
 =?us-ascii?Q?UDuxOZSRXQ9t2He1MquNRbw2DHC13tg2IEdNI43jZsGtHyJXDjd8+T+e91wd?=
 =?us-ascii?Q?XKbnBQp/e4Wtq7/0I4+p5sQYnFnnsM9L7qidBzDQrv6HtKbl8bfwIbDHh07+?=
 =?us-ascii?Q?daSc21aDIb1bzK4gXYLa2kS4+8rnw0dQ+i7ALCRoXa69EVkvr7SyQa1lheiH?=
 =?us-ascii?Q?c4yomG44B3BZSWVaUI4EdJ7loG7tHZgh4iVKdyWFfTy1xOmWGgp2UbRmiTQe?=
 =?us-ascii?Q?qY5MRFgv18R10Mi+o27gPxTEAxf3YrE4RjO9bk43gz7aa88mkJPtBMeOyZxJ?=
 =?us-ascii?Q?FDMnyDbArfSALzXj4f/tHJB0VneTaxD6uK6eSQjkS62OGyYaSf6WdJguCP+m?=
 =?us-ascii?Q?VGhl2RxxUFMkkKldb5+t36/OKxIrgEMUrv37mfBkT1Q4RyBoH133MaekOY3l?=
 =?us-ascii?Q?2unlnis1JT5zNOs3xXidAnm8eSvHz68e2kO22FfeHRxeveIOGPqRJ5X/DhHj?=
 =?us-ascii?Q?p3AefWgO2ev2TnMjsce3n992HGXFflNSEu8HDb4goqTMSnIRs0mHEnY80nV3?=
 =?us-ascii?Q?Ka/94z72oZhevT2EQmjja/xx9FTfd2ywbQhAj6piri38e/TOEI5+HTCh4iPI?=
 =?us-ascii?Q?eSvZ8O1P+g8uiOekoKaP+QmPjIdn/KRButo5X1POa9wgugGyUMX0oFRuGhM+?=
 =?us-ascii?Q?xC/cfd6O1eYDDqDu0f99/5Bnr+N+0k6qEc0aMFuWOu/RMHCEOlq/f3e1idbs?=
 =?us-ascii?Q?zU3dVftRMYn2chNRFQwWoUI+Z8WWV/jMiJQvSp0PeE/z2JnEp76Vx2/yNrhY?=
 =?us-ascii?Q?oqH/Blr7ikx8fgk8UC26Fym8JEkuOKJRN7hvvu9CJ/jqK6qQXKjSlAWFja9W?=
 =?us-ascii?Q?mi9LjE3vmJgakRzBWENgnxBoOrC8+/a/4Fv5THioExXhLoraMO+6+Q4+TTFJ?=
 =?us-ascii?Q?xLFK57YCRjCy+vBLTWszF4llF84RMmt1fsy+Ncy8o3wVdfBM2YIzUuTQnu/N?=
 =?us-ascii?Q?F5hGceMsjr/fdom8xKELZq/54Fp9pGjtnxdXN8mwTOJq8GOx7Igc28VkOteO?=
 =?us-ascii?Q?pZ7fsLONZP4Kz4OiG9MwuRT/Vnxrv6LZZcRm5QnM09x51gzJx+CnmdLW+ZIc?=
 =?us-ascii?Q?Sy/q9KbgmxBRiHgCE7LBs+kQFN10yY8i/P6u1E8Z1J98DTUxu1x0R/G8Ryvb?=
 =?us-ascii?Q?kFAiiTE2FJaznfPpnP/Xtiz/vCD/fvLU46Pgmh+b9GUk3u0JgkePbCXA7trx?=
 =?us-ascii?Q?tvR1mo3cvoHB9ySZ+9QrPPxbUEIDGoWE4xh7yLOs9wr6xX5TPhd1xR4rA6xD?=
 =?us-ascii?Q?xuV55BSkwbWJMw1+Mn2vTBWjAF5OFVtrqSbqGcUM9nnoDdXJ5XGLaeJPkAGv?=
 =?us-ascii?Q?L87EOFkmYPf0wV6JjfIXZBuWUSCHkehhGVmi+/Hh6EoFSZm04GqWE7fzB+hA?=
 =?us-ascii?Q?YKbwWAMd5sf0HuDbnGgFhu3IwDrdoKQuTmrpaySDwiJS3TxCRpmGL5+NyAMH?=
 =?us-ascii?Q?t3w7L2OtxuTxAKAOZL4tI920gZzD/J+bh3e3RpD3BJFdI9DE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE3P153MB1848.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 84372d05-1a3d-4a26-dd56-08df08145897
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 10:32:38.8542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgGvr2iM33EjZB3mN+Ip/B1VGvmDjqhsz7dVt6Zf1EmZnBFCdKyoDoJ+KXwcN95Jy2lv958/wn34uaBCIRra2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8P153MB2253



> -----Original Message-----
> From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> Sent: Monday, August 31, 2026 7:49 PM
> To: Wei Hu <weh@linux.microsoft.com>
> Cc: linux-hyperv@vger.kernel.org
> Subject: [EXTERNAL] Re: [PATCH v4 1/9] mshv: retain memory regions until
> unmap succeeds
>=20
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s)
> to consider:
>=20
> New issues:
> - [Critical] Early return in MMU interval notifier allows guest-to-host u=
se-after-
> free because it falsely signals that guest access has been revoked before=
 the
> hypervisor unmap completes.
> - [High] ABBA deadlock between `mreg_remap_lock` rwsem fair-queueing and
> HMM sequence counter invalidation due to holding locks across a retry loo=
p.
>=20
> Pre-existing issues:
> - [Critical] mshv_region_interval_invalidate() returns false for blockabl=
e ranges
> if remapping fails, leading to silent UAF.
> - [Critical] Incorrect MMIO physical address mapped for user memory regio=
n,
> allowing arbitrary physical memory access.
> --
>=20

Hello Sashiko,
The pre-existing issues will be addressed in a separate patch set. They wil=
l not be resolved in the future revisions of this
patch set.=20

Thanks,
Wei


> commit bdfaa07680341c254374f6fa979c3fcd550c4840
> Author: Wei Hu <weh@microsoft.com>
>=20
> mshv: retain memory regions until unmap succeeds
>=20
> Do not remove a region from the partition list or unpin its pages until a
> checked UnmapGpaPages hypercall has completed. Validate repetition
> progress so malformed zero or oversized completion counts cannot spin or
> conceal partial state.
>=20
> [ ... ]
>=20
> > diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
> > index 6d65e5b421529..9feb49d9d9d49 100644
> > --- a/drivers/hv/mshv_regions.c
> > +++ b/drivers/hv/mshv_regions.c
>=20
> [ ... ]
>=20
> > @@ -452,12 +458,35 @@ static int mshv_region_range_fault(struct
> mshv_mem_region *region,
> >  	range.start =3D region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
> >  	range.end =3D range.start + page_count * HV_HYP_PAGE_SIZE;
> >
> > +	/*
> > +	 * Pin the mm while the remap gate still guarantees that the interval
> > +	 * notifier is registered. Do not acquire mmap_lock while holding the
> > +	 * gate: invalidation enters with mmap_lock held for write.
> > +	 */
> > +	down_read(&region->mreg_remap_lock);
> > +	if (READ_ONCE(region->remap_blocked) ||
> > +	    !mmget_not_zero(region->mreg_mni.mm)) {
> > +		up_read(&region->mreg_remap_lock);
> > +		ret =3D -ECANCELED;
> > +		goto out;
> > +	}
> > +	mm =3D region->mreg_mni.mm;
> > +	up_read(&region->mreg_remap_lock);
> > +
> > +	/* Lock order: mmap_lock -> mreg_remap_lock -> mreg_mutex. */
> > +	mmap_read_lock(mm);
> > +	down_read(&region->mreg_remap_lock);
> > +	if (READ_ONCE(region->remap_blocked)) {
> > +		ret =3D -ECANCELED;
> > +		goto out_unlock_remap;
> > +	}
> > +
> >  	do {
> >  		ret =3D mshv_region_hmm_fault_and_lock(region, &range);
> >  	} while (ret =3D=3D -EBUSY);
>=20
> [Severity: High]
> Does holding mreg_remap_lock across this retry loop create an ABBA
> deadlock?
>=20
> If a concurrent page fault and region unmap occur:
> 1. The fault handler acquires mreg_remap_lock for read and blocks here
> waiting
>    for mmu_interval_read_retry() to clear.
> 2. The unmap thread queues for the mreg_remap_lock write lock in
>    mshv_unmap_user_memory(), blocking new readers due to fair-queueing.
> 3. The MMU interval invalidation callback mshv_region_interval_invalidate=
()
>    (which would clear the retry loop) attempts to acquire mreg_remap_lock=
 for
>    read, but gets stuck behind the queued writer.
>=20
> Can the fault handler loop forever holding the read lock, freezing the ho=
st
> kernel?
>=20
> [ ... ]
>=20
> > @@ -524,6 +558,17 @@ static bool mshv_region_interval_invalidate(struct
> mmu_interval_notifier *mni,
> >  	unsigned long mstart, mend;
> >  	int ret =3D -EPERM;
> >
> > +	if (mmu_notifier_range_blockable(range))
> > +		down_read(&region->mreg_remap_lock);
> > +	else if (!down_read_trylock(&region->mreg_remap_lock))
> > +		return false;
> > +
> > +	/* A completed checked unmap makes notifier remapping
> unnecessary. */
> > +	if (READ_ONCE(region->remap_blocked)) {
> > +		up_read(&region->mreg_remap_lock);
> > +		return true;
> > +	}
>=20
> [Severity: Critical]
> Does this early return falsely signal that guest access has been revoked =
before
> the hypervisor unmap completes?
>=20
> If mshv_unmap_user_memory() sets remap_blocked =3D true but has not yet
> acquired the mreg_remap_lock write lock to issue the hypervisor unmap, a
> racing MMU invalidation could acquire the read lock first, see remap_bloc=
ked
> =3D=3D true, and immediately return true.
>=20
> Could the MM subsystem then free the page while the hypervisor unmap has
> not yet executed, leading to a guest-to-host use-after-free?
>=20
> [ ... ]
>=20
> >  out_unlock:
> >  	mutex_unlock(&region->mreg_mutex);
> >  out_fail:
> > +	up_read(&region->mreg_remap_lock);
> >  	WARN_ONCE(ret,
> >  		  "Failed to invalidate region %#llx-%#llx (range %#lx-%#lx,
> event: %u, pages %#llx-%#llx, mm: %#llx): %d\n",
> >  		  region->start_uaddr,
>=20
> [Severity: Critical]
> This is a pre-existing issue, but does mshv_region_interval_invalidate() =
return
> false on a blockable range if mshv_region_remap_pages() fails?
>=20
> The core MM __mmu_notifier_invalidate_range_start() explicitly ignores th=
e
> return value of blockable notifiers. By returning false instead of ensuri=
ng the
> mapping is torn down, the driver silently fails the invalidation contract=
.
>=20
> Does this allow the core MM subsystem to free or reuse a host page while =
the
> guest VM retains mapped access to it, resulting in a guest-to-host use-af=
ter-
> free?
>=20
> [ ... ]
>=20
> > diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
> > index cc2cfce2aefdb..1ca14660f9985 100644
> > --- a/drivers/hv/mshv_root_main.c
> > +++ b/drivers/hv/mshv_root_main.c
>=20
> [ ... ]
>=20
> > @@ -1397,13 +1398,15 @@ mshv_map_user_memory(struct
> mshv_partition *partition,
> >  		ret =3D hv_call_map_gpa_pages(partition->pt_id,
> >  					    region->start_gfn,
> >  					    region->nr_pages,
> > -					    HV_MAP_GPA_NO_ACCESS, NULL);
> > +					    HV_MAP_GPA_NO_ACCESS, NULL,
> > +					    &region->mapping_may_exist);
> >  		break;
> >  	case MSHV_REGION_TYPE_MMIO:
> >  		ret =3D hv_call_map_mmio_pages(partition->pt_id,
> >  					     region->start_gfn,
> >  					     mmio_pfn,
> > -					     region->nr_pages);
> > +					     region->nr_pages,
> > +					     &region->mapping_may_exist);
> >  		break;
> >  	}
>=20
> [Severity: Critical]
> This is a pre-existing issue, but does mshv_map_user_memory() allow
> mapping of arbitrary physical memory by passing an unadjusted MMIO PFN
> and unvalidated size directly to the hypervisor?
>=20
> By using vma->vm_pgoff directly without adding the intra-VMA offset
> corresponding to the userspace_addr, and by failing to validate that the
> requested size fits inside vma->vm_end:
>=20
> drivers/hv/mshv_root_main.c:mshv_map_user_memory() {
> 	vma =3D vma_lookup(current->mm, mem->userspace_addr);
> 	is_mmio =3D vma ? !!(vma->vm_flags & (VM_IO | VM_PFNMAP)) : 0;
> 	mmio_pfn =3D is_mmio ? vma->vm_pgoff : 0;
>     ...
> }
>=20
> Could a malicious userspace process set userspace_addr to an offset withi=
n a
> legitimate MMIO VMA (or beyond it) and map arbitrary contiguous physical
> memory into the guest VM?
>=20
> --
> Sashiko AI
> review * https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F
> %2Fsashiko.dev%2F%23%2Fpatchset%2F20260831112704.2851147-1-
> weh%40linux.microsoft.com%3Fpart%3D1&data=3D05%7C02%7Cweh%40micr
> osoft.com%7Cf41ea7e6afe44d8b0d6208df0755cacd%7C72f988bf86f141af
> 91ab2d7cd011db47%7C1%7C0%7C639237737234695849%7CUnknown%
> 7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3DnKKIfw5wbEV33vK8LJGwQNDyA3zm%2F5DYBZgHWDH0x2U%3D&reserve
> d=3D0
