Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2187F3AAF47;
	Thu, 17 Sep 2026 03:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617442; cv=none; b=mJmKixRABuXIqOIzALnMgkuSfInTwPRJGd4VhuLXq4479xCxJEj12r9hN++gGxIK3Fci1MhLMys7gQbkg5rmf/TufBL3vo67kHvvpCgWySe8YE+T7rf0Yh/5sjYp3g5+YSQqFxsvBNwwnfFexSFv7KcTZQzOFBLH3yZJfa8Oy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617442; c=relaxed/simple;
	bh=B+rSOSOnegeAMUd7zeVQ4DpJHbo42RJ1R2JS9cqUbSA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZKtCPNNR+ellOYvotoXjuAYDBx5qsLYTsEcdzjJutq8U/MMm/t0SPBinAYu6AjUuixmnP/aZH2de6l0S9IU7rpOUJq5SD76lBQ91843ykn/B9j+1fkvSrC4+saOEK/ugzc9hSh/f69MhmKP+E6ISFDCrFnfEjDsDckeBL9nZ5cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=B/XNQLTy; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="B/XNQLTy"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GG1hNi046034;
	Thu, 17 Sep 2026 03:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1T5SeJ
	OxBQ/rLifiY/zHGXLPjFKE+cFkjLwBKJuyFZs=; b=B/XNQLTycVYJmFWqIk8Mfk
	/G4Fyh6BCipJO786DJ/LFJd3xtGdA23vRQmL14pfU+T37Xl6VvT3yKv0X14Rc/XJ
	D9UY8lx2kMEiajMpYrW8BpLb7zvJdy+QGliSBKyAUhJc0S5moH8QuPiDMwwCqbds
	dQ0xCchAJgcWQJa7lZQND42XhddBlrBm/hyDzae3P/K69Mw+JY8ktm0LaBEysR8m
	8CcgEipdcawr/0LdBH/nmiwXmBbEdLR0VGCgMO2Sd29HnWG/KZoq1+H0ovoSdi18
	hBrvGc2aXWyWs9/R7iTxsR02Mil2hwZiggc3ECEte42tZdL5qhBFkbiHr2xRUVrg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcv7rt7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 03:57:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0idHe2316524;
	Thu, 17 Sep 2026 03:57:16 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gr5xa0h97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 03:57:16 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68H3uXSp65012218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 03:56:33 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C604E5803F;
	Thu, 17 Sep 2026 03:57:15 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25CE15804E;
	Thu, 17 Sep 2026 03:57:15 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.186.148])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Sep 2026 03:57:15 +0000 (GMT)
Message-ID: <cbb299133cca3329b68f036598ef7cf6f4da82db.camel@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/pseries/dlpar: Remove DT entries if failure
 from CPU ADD notifier
From: Haren Myneni <haren@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
        tyreld@linux.ibm.com
Date: Wed, 16 Sep 2026 20:57:14 -0700
In-Reply-To: <20260916044746.A8F431F000FF@smtp.kernel.org>
References: <20260916043249.2062676-1-haren@linux.ibm.com>
	 <20260916043249.2062676-2-haren@linux.ibm.com>
	 <20260916044746.A8F431F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0MiBTYWx0ZWRfX6/hKJO6VKNo2
 pnCEXpFOJfnSrO+SPSUEqXfr0GtbWBNCuUqdTHkbUGjed180VMf5KR6VSRNxfmSr9q6fCFghhMh
 J03SnCVV3P7ntlkFKUELC8dFH4M5HqU=
X-Proofpoint-ORIG-GUID: V6UmMawbT1urXPe6_zEBD2U2DyR2EkZz
X-Proofpoint-GUID: V6UmMawbT1urXPe6_zEBD2U2DyR2EkZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0MiBTYWx0ZWRfXwoOHXl2lLREj
 vnUaibkzaM9UEF/7KfPTuT/z+uIciAfJ8tAZLlBI4tx1UG4VBctYJSWe+ZOJzRD3EQlzH/6/Nym
 +03MmJLdqA2nmTJ2fgeEME31plBK32ahWM4i6fe8V2jF9yefpCOy8gpMdQrrHZoCYJYix4aHje2
 9KhqrtX2l6tI4aDDdy0KjejlN1FF6LNUYHRlZNrW+w6drQ/cBz64jm7EMICLJQkfYAijKDLyXq5
 hpFp59/7vbkLBXkyx/d+6ibvwEWZzpSbr1QdsvdRrJfTH0ULagyAJU1S4zh6SFT2fx/eZrgruw7
 73cAjndbuDf+r6v2KU76/lafxHr6skLHKP0AVo9ORQlN1IC1XKabx8m6aUZkOAJmDPsHA831Yrb
 1hMEaPAAO3GRrSCKXAPN34bQCMmu3AdPEQwStokGtR5AETcVJiQLiCnSzjbrMDPDG23ryhIpu6P
 7Mdy36QAt4CKTDVFbeQ==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aab651c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=v2YYfxBV-KFbQxyhLbIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170042

On Wed, 2026-09-16 at 04:47 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [High] of: kernel panic in __of_detach_node() due to unattached
> node
> - [High] powerpc/pseries: sibling device nodes leaked on hotplug
> error path
> --
>=20
> commit 4b977223f26c877c63148563cad8a84f1583e398
> Author: Haren Myneni <haren@linux.ibm.com>
>=20
> powerpc/pseries/dlpar: Remove DT entries if failure from CPU ADD
> notifier
> =C2=A0=C2=A0=C2=A0=20
> For CPU ADD, the device tree entries are retrieved with
> configure-connector RTAS call and attached to the device tree.
> Then the CPU is added as part of DT node notification. If the CPU
> ADD notifier returns failure, this patch calls
> of_detach_node_no_notify()
> instead of dlpar_free_cc_nodes() to prevent device tree issues.
>=20
> > diff --git a/arch/powerpc/platforms/pseries/dlpar.c
> > b/arch/powerpc/platforms/pseries/dlpar.c
> > index f4d33b8dffd85..01a9849773cd1 100644
> > --- a/arch/powerpc/platforms/pseries/dlpar.c
> > +++ b/arch/powerpc/platforms/pseries/dlpar.c
> > @@ -247,15 +247,18 @@ int dlpar_attach_node(struct device_node *dn,
> > struct device_node *parent)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -int dlpar_detach_node(struct device_node *dn)
> > +int dlpar_detach_node(struct device_node *dn, bool notify)
> > =C2=A0{
> > =C2=A0	struct device_node *child;
> > =C2=A0	int rc;
> > =C2=A0
> > =C2=A0	for_each_child_of_node(dn, child)
> > -		dlpar_detach_node(child);
> > +		dlpar_detach_node(child, notify);
>=20
> [Severity: High]
> Does this code leak sibling device nodes?
>=20
> In the error handling path of dlpar_cpu_add(), when
> pseries_cpuhp_attach_nodes() fails, dlpar_detach_node(dn, false) is
> called
> to clean up. However, the old dlpar_free_cc_nodes() used to
> recursively
> free dn->sibling. This new implementation only iterates through
> children and
> completely ignores dn->sibling.
>=20
> If siblings were returned by configure-connector but never
> successfully
> attached, or if they were attached but later notification fails, are
> those
> sibling nodes permanently leaked?

of_attach_node() sets the one of current CPU nodes as sibling to the
new CPU node.
Since the sibling nodes are the existing CPU nodes, should not be
freed.
The current code (dlpar_free_cc_nodes(dn)) removes sibling nodes which
is a bug and causes an issue when trying to add new CPU in future..=20

>=20
> > =C2=A0
> > -	rc =3D of_detach_node(dn);
> > +	if (notify)
> > +		rc =3D of_detach_node(dn);
> > +	else
> > +		rc =3D of_detach_node_no_notify(dn);
>=20
> [Severity: High]
> Can this cause a NULL pointer dereference leading to a kernel panic?
>=20
> If of_changeset_attach_node() fails in pseries_cpuhp_attach_nodes()
> (for
> instance, due to an allocation failure), the dn node is never
> attached to
> the device tree's sibling list, and its OF_DETACHED flag remains 0.
>=20
> If dlpar_cpu_add() then attempts to clean up by calling
> dlpar_detach_node(dn, false), this code forwards the unattached node
> to
> of_detach_node_no_notify(dn). Since OF_DETACHED is 0, it calls
> __of_detach_node(np).
>=20
> Inside __of_detach_node(), the node is not found in parent->child,
> causing
> the prevsib pointer to traverse past the end of the list to NULL,
> leading to
> a crash at prevsib->sibling =3D np->sibling.

will change:

if (rc && dn)  /* in case of memory allocation failure */
	dlpar_detach_node(dn, false);


>=20
> > =C2=A0	if (rc)
> > =C2=A0		return rc;
> > =C2=A0
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > index bc6926dbf1489..db359fa3f9224 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > @@ -603,7 +603,7 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
> > =C2=A0
> > =C2=A0		rc =3D dlpar_release_drc(drc_index);
> > =C2=A0		if (!rc)
> > -			dlpar_free_cc_nodes(dn);
> > +			dlpar_detach_node(dn, false);
> > =C2=A0
> > =C2=A0		return saved_rc;
> > =C2=A0	}
