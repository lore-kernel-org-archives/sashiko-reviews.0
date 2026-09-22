Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89455304CA;
	Tue, 22 Sep 2026 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119976; cv=none; b=DK7C1v3fbXau4rG9EJ608RfwLPD3bJPj0TylrfAO265pgSdt4QxturKGdyrBudWiRM1SGMuYTjICr5Huy3ZYlYSvpFUONuLylYduiB6YcS+aZw6OX0Ldx+28nPGRj1/nATo0nRTfIQRpvygCPvjsWNec6ThV4KkMp4+7t0o6Srk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119976; c=relaxed/simple;
	bh=SiDh8/TX0zYQGZFPk/3p6AwW0Ud78uH55m/pmWk9uhs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aPiMBLooZGG+Je0UMVzCUEVOwiat5BI301QsqnERDfCHJLX2Yr8AntHNnIXi3/2ecgeBgDmGZ77n275k7AdIpGId3UTJOm0Y6MSjBsoKDdA1blWRL1WNITnj4p+34Sy5yvaCSpgGM0+piwv55ME920OlHcFXYRMLZGl2GLT2Ws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Z6bSszb+; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Z6bSszb+"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI743O4143509;
	Tue, 22 Sep 2026 23:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BTV/2p
	/sD4txvpbEuYaYkmkQd9jDPvhFuuZrGKcifGU=; b=Z6bSszb+lCwpx4sVR6Vq3p
	WQC09GYyOWPgK3rbG2HxNqEdCAfcD0mWIaYITzkEkLqFNgFbptyHC4BbzjrM08RK
	YY+BiuIxYN2NDr/1ZxqPcOboCW+SGhtiTkn7dwPqD04BSe1z2pUsiDquhsjdFB4y
	kM1p7kaKudlA8gLfJ7wFw9c6xXQWKsizSkgTOE6RCKuEOPKy0ZtuPRT26uDZzX71
	i8P4gocU2j6LpO9EIliaGIz5wYHOIx+CzPWg1X4oSztylxRzov3T12egVOH2dMN6
	P4M+amoQjdruqxI5p+fxn9ABjBKaCHugUwCEn3ti4Nw+lePESM54Vd9Kxr80DEqA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskgqg028-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 23:32:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN613H3279475;
	Tue, 22 Sep 2026 23:32:48 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gt4qqc29q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 23:32:48 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68MNWlG727525750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2026 23:32:47 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4936858102;
	Tue, 22 Sep 2026 23:32:47 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF1BE58101;
	Tue, 22 Sep 2026 23:32:46 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.14.79])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Sep 2026 23:32:46 +0000 (GMT)
Message-ID: <2c68a339f042335430d88132dc448510c98861b2.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/pseries/dlpar: Remove DT entries if
 failure from CPU ADD notifier
From: Haren Myneni <haren@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Date: Tue, 22 Sep 2026 16:32:46 -0700
In-Reply-To: <20260921034731.D7F391F000FF@smtp.kernel.org>
References: <20260921033156.991481-1-haren@linux.ibm.com>
	 <20260921033156.991481-2-haren@linux.ibm.com>
	 <20260921034731.D7F391F000FF@smtp.kernel.org>
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
X-Authority-Analysis: v=2.4 cv=G+OJgNk5 c=1 sm=1 tr=0 ts=6ab31021 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=D_8-g3vMd_KBQvPCQQIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNSBTYWx0ZWRfX+f1jWLoYQRoc
 uOStO+UoYPSfVXzKEGd+l1Mla7EvG7lA8f1h7ENoWrXWqmMZgnirg86KJuw0Uym/OrlCB4cwv/Z
 s2Ip6jHhQjECj30KQv9Rf8T+C8yHz5hctY1yhzQxRPKbPE2svMGbX+5ZuWqcpnw2EBm8dznPI03
 uAsDvCMzwGE+LGlcHCMYTc31w3LwhBw6nvQHM/dsg+HVkqDk24T3KURF5eVk5aGhGKEaagGW3Z9
 96qjamiodurlO9K71RKbWGqIlMz4DRAICxz0gdo784TTZoq/+LazZ12cUyXMfP3sErIGWTQFzgB
 yOYkbN8Dwh0YPwyi1ZLO6DjOe3ngcF497gfWW8enJ+nHqyP23JzO/Hv9qyAJ2tkLyC+RoST59Jb
 FYJBkrAyHta1C+88U4g0cTCqVf5SsY6E7B/FGsAl+YRwo8KZwVh5I1YT3f0mm/JTxAX4cy4QPKE
 NFwLJJVW7ffhvsA6r5w==
X-Proofpoint-ORIG-GUID: biNHngOEu2qJnIWK0FRfF4gJz3esAfxA
X-Proofpoint-GUID: biNHngOEu2qJnIWK0FRfF4gJz3esAfxA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNSBTYWx0ZWRfX8U4Sf2juI4UL
 kNmdKIqzk0WnTxOitclrSeJoPzd23XLwOBUDyy1Da4ldF7cespUXCdlIz4c3LzbifVjAaFLKB2x
 /qSBJVV+xp8FGoQ/0Zjy1Y1Jqb6QHLc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220305

On Mon, 2026-09-21 at 03:47 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> - [High] powerpc/pseries: NULL pointer deref in __of_detach_node on
> error path
> - [Medium] powerpc/pseries: memory leak of unattached sibling device
> nodes
> --
>=20
> commit 79a5af10ba412eed58ff43cc8d6339b8b6eee45f
> Author: Haren Myneni <haren@linux.ibm.com>
>=20
> powerpc/pseries/dlpar: Remove DT entries if failure from CPU ADD
> notifier
>=20
> For CPU ADD, the device tree entries are retrieved with
> configure-connector RTAS call and attached to the device tree.
> Then the CPU is added as part of DT node notification. If the CPU
> ADD notifier returns failure, the corresponding CPU node entries
> should be deleted from the device-tree.
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
> [Severity: Medium]
> Will this leak unattached sibling device nodes on the error path?
>=20
> dlpar_configure_connector() can return a chain of device nodes linked
> via
> dn->sibling. The error path in dlpar_cpu_add() previously called
> dlpar_free_cc_nodes(dn), which handles sibling traversal.
>=20
> By replacing it with dlpar_detach_node(dn, false), which recursively
> processes children but explicitly does not traverse dn->sibling, do
> we
> permanently leak any unattached sibling nodes returned by the
> connector?

No leak here. dlpar_configure_connector() can also return sibling
nodes, but this interface should detach node and its children. Same use
case as before dlpar_detach_node(). We have bug in the previous use of
dlpar_free_cc_nodes() in dlpar_cpu_add(). Example: For CPU node, No
sibling node is returned from dlpar_configure_connector() and the other
existing CPU node is attached as sibling to the new CPU node
(of_attach_node()).=20

>=20
> > =C2=A0
> > -	rc =3D of_detach_node(dn);
> > +	if (notify)
> > +		rc =3D of_detach_node(dn);
> > +	else
> > +		rc =3D of_detach_node_no_notify(dn);
>=20
> [ ... ]
>=20
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > index bc6926dbf1489..15122aab05b24 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > @@ -602,8 +602,8 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
> > =C2=A0			dn, rc, drc_index);
> > =C2=A0
> > =C2=A0		rc =3D dlpar_release_drc(drc_index);
> > -		if (!rc)
> > -			dlpar_free_cc_nodes(dn);
> > +		if (!rc && dn)
> > +			dlpar_detach_node(dn, false);
>=20
> [Severity: High]
> Does this code trigger a NULL pointer dereference when
> pseries_cpuhp_attach_nodes() fails?
>=20
> In dlpar_cpu_add(), if pseries_cpuhp_attach_nodes() fails, the device
> node
> dn remains unattached from the device tree. This error path then
> calls
> dlpar_detach_node(dn, false), which invokes __of_detach_node().
>=20
> Because dlpar_parse_cc_node() does not set the OF_DETACHED flag on
> allocation, __of_detach_node() assumes the node is attached and
> iterates
> over its parent's children to unlink it:
>=20
> drivers/of/dynamic.c:__of_detach_node() {
> 	...
> 		for (prevsib =3D np->parent->child;
> 		=C2=A0=C2=A0=C2=A0=C2=A0 prevsib->sibling !=3D np;
> 		=C2=A0=C2=A0=C2=A0=C2=A0 prevsib =3D prevsib->sibling)
> 			;
> 		prevsib->sibling =3D np->sibling;
> 	...
> }
>=20
> Since the node was never linked, it is not in the list, and the
> traversal
> pointer prevsib reaches NULL.=C2=A0 Will this cause a guaranteed NULL
> pointer
> dereference (prevsib->sibling) and kernel panic?

No, pseries_cpuhp_attach_nodes() returns failure in 3 cases:
- dn allocation is failed from of_changeset_attach_node(). 'if (!rc &&
dn)' prevents the NULL pointer access.
- if dn is not attached, 'if (!of_node_check_flag(np, OF_DETACHED))'
check prevents=20
- if the dn notifier is failed, fixing this issue with the new
interface. of_detach_node_no_notify()

>=20
> > =C2=A0
> > =C2=A0		return saved_rc;
> > =C2=A0	}
