Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAD3845B0;
	Thu, 17 Sep 2026 04:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618280; cv=none; b=TvTNjjdFjiSCKnLOBSh40pFht12bGIvF+7CF9gohuANdQv7iEtEO+U3eSRMMAWnA++uiEcjRtTJRRTu4soN0s2tnSmi4+1INe62eDRyX6+b+HRA6qXJyzahUvtqihw7QzeDWvpbO8t1P68T1yMIpwhVGbczkXZ7Jh9Lagg61cnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618280; c=relaxed/simple;
	bh=we1m1jEAfR7/RyjpX102kuHxM5ioDz/PLlnSdVBFYVo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VD/qDFktskIwJ5is2ja2x0a56VVUDFt7I7GEjvQETdgHs7zDN93yBCRQ2W5hBuJIuFh+yk1DXK56LWACN1z4eCQg/HvRak+YgmYg26Ja2V1j0Fixjlxu3JD7m00i1vNd8gsW4EElxlPCSbtqoVps6phiDVt8H18zCivozHm14B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fiQjpNVL; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fiQjpNVL"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H3qGR2046003;
	Thu, 17 Sep 2026 04:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=N/q4Ru
	Hp1PyteYplGm2Sq2HXgk4PPDKo/KhID+xUTyE=; b=fiQjpNVLExwP5hQ3lmDXCL
	YJkc8iijRuiEvrv7LfZXW6ynS7tc5UY5SMOME8JjOPrm4foHtkeIBmFqFu4og8RJ
	TByiZe3Zr2X0ItUsXdYJl72Qj8bJPWxxA2W1EcLCwH42NUBu/JfI52OSWbKngn3o
	zsoeBKF0H2eHG3827QbNxOT+Pmu0DDWIY9suPYVZ9ADyVFNvihwiORX1B4/rliDw
	s5jorFh/T3xL3lp4HhRt+TCger38+7sae98o5+4TyjSBUPtKuqi2LfOSkaJXLp8t
	WQyYRvIAz/lVk+RNmB4FfAUpGzX7Rur0kSgiCAMLzDQIXWeTFnZ7TDcHpFYOisRA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxcv7ta7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:11:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0DCpD2266348;
	Thu, 17 Sep 2026 04:11:15 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gr5fjgp3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:11:15 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68H4BEu846662042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 04:11:14 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B6EE5805A;
	Thu, 17 Sep 2026 04:11:14 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B06A35805D;
	Thu, 17 Sep 2026 04:11:13 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.186.150])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Sep 2026 04:11:13 +0000 (GMT)
Message-ID: <cc4cba7c4d0d1c45879fdeb90f732469a98cc723.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] drivers/of: Add of_detach_node_no_notify()
From: Haren Myneni <haren@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        tyreld@linux.ibm.com
Date: Wed, 16 Sep 2026 21:11:13 -0700
In-Reply-To: <20260916044334.3EA551F000FF@smtp.kernel.org>
References: <20260916043249.2062676-1-haren@linux.ibm.com>
	 <20260916044334.3EA551F000FF@smtp.kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0OCBTYWx0ZWRfX5KLAw4XfgJP+
 uZfNvXtbKY1rvuLclIVYUkNhClYvB8UFbZu+IEhh+z9p+8SkjNG1RTjFmEVmkb8xcdin+mTIkuV
 iVuI8FESGq7XDAMEOc4rXiaMAE0eOvg=
X-Proofpoint-ORIG-GUID: VXL2Gz5MUrZCqLfbzhhvnsotDaClgoHJ
X-Proofpoint-GUID: VXL2Gz5MUrZCqLfbzhhvnsotDaClgoHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0OCBTYWx0ZWRfX4iduixb1xABM
 RGp76FGwkAdL7Wxyz10H3JiWqZF1fQJDBteewpzoYHQxsjB0BCMp6NVC1stFjtmtpaNYXATm27o
 wMR1vei8h8OSpF+/fLnXHge0+bsB+lvSIU5eVDUfd99DnpT5uKzlHu/YZHMjMhLYZhaSfL+sDIv
 QE/dI+0StBHDd8KvACfm1hdlt00XZC8c5zsfzP1NnP++vVdXN1j1GbXkcJB3FiTd/QBUzFzrOXr
 WaRgB1eNYrUieDvg77Mis2rryWC0/r06DhQJYxyfV5uxdI0xA7Op6aMcmyX7kc0WvTdZO3LMhbJ
 cHai2R3b6/5b6RA1F0Oh1cNLV6TsHUxJtH3E6BBKR1cCAivoBGdZp72j4ONOO6VGzlHY2qLVSXe
 u+r2S0m/o5LYXeAPTV9a7YZ8rEhmRoNnXYdkQDey1Y4y7fUwnVTsVUCJg5jiPnZRV5lArcLOFu3
 rg8zncLU+rxGF8OKQMg==
X-Authority-Analysis: v=2.4 cv=F+7C5ahN c=1 sm=1 tr=0 ts=6aab6863 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=QtoC-mqgD6cNROxKcZIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170048

On Wed, 2026-09-16 at 04:43 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] of: state corruption and resource leak via
> of_detach_node_no_notify()
> --
>=20
> commit 900ccea33cdd682696cd3ae6fb47477962cee9f0
> Author: Haren Myneni <haren@linux.ibm.com>
>=20
> =C2=A0=C2=A0=C2=A0 drivers/of: Add of_detach_node_no_notify()
>=20
> This commit introduces the of_detach_node_no_notify() interface. It
> allows
> callers to remove nodes from the device tree without triggering
> reconfiguration
> notifiers, intending to provide a cleanup path when node addition
> fails.
>=20
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index 744ce0e1eb24a..fc6f22371a97c 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
> [ ... ]
> > @@ -318,6 +318,22 @@ int of_detach_node(struct device_node *np)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(of_detach_node);
> > =C2=A0
> > +/**
> > + * of_detach_node_no_notify() - "Unplug" a node from the device
> > + * and return without running notifiers.
> > + * @np:	Pointer to the caller's Device Node
> > + */
> > +int of_detach_node_no_notify(struct device_node *np)
> > +{
> > +	mutex_lock(&of_mutex);
> > +	if (!of_node_check_flag(np, OF_DETACHED))
> > +		__of_detach_node(np);
> > +	mutex_unlock(&of_mutex);
> > +
> > +	return 0;
> > +}
>=20
> [Severity: High]
> Does this bypass of of_reconfig_notify(OF_RECONFIG_DETACH_NODE) cause
> state
> corruption and resource leaks?
>=20
> When of_changeset_apply() fails during the notification phase (for
> example,
> if a subsystem returns an error for OF_RECONFIG_ATTACH_NODE), earlier
> subsystems in the blocking_notifier_call_chain may have already
> successfully
> processed the ATTACH_NODE event and allocated resources such as
> platform
> devices or cached node pointers.
>=20
> If of_detach_node_no_notify() is subsequently used to undo the
> changeset, the
> required OF_RECONFIG_DETACH_NODE signal is intentionally suppressed.
> Will this
> leave the successfully attached subsystems blind to the removal,
> resulting in
> permanent resource leaks and potential use-after-free of the device
> nodes via
> dangling pointers?
>=20
> This path can be reached through userspace-initiated CPU hotplug
> operations
> (DLPAR) that exercise this error path.

Yes, of_changeset_apply() can add  and have successful notifiers for
some nodes. of_detach_node_no_notify() is called for each node ( its
children first and then the parent node) in dlpar_detach_node() and up
to the caller.=20

For CPU nodes, only the parent CPU node has the notifier. and=20
of_detach_node_no_notify() is issued only for the failure from the
notifier. So should not be an issue.=20
