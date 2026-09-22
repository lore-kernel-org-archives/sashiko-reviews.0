Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F856356742;
	Tue, 22 Sep 2026 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100138; cv=none; b=AZn5l85owt15oRZHmsq/ETpjwC5tt7JSLfR+Q9dK+0JH74tne8P63/FsJ/642vm1OJg1UMOwNqseJyS/gHh3CLkX7F9AjS+4Nu73h4jopcTIdrJjaYKpi1YT3OrLVovcqSnD4TKZU4QvEJT7Rt0zlJJix4XwiypgsyLl/+EgNnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100138; c=relaxed/simple;
	bh=OpQrQxAUA2wj7OjGnGO/fDpKR3trSKknumbF3UjtAjM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CRRlUCL5FO+E7GrX/V8G+ZJsQfdJucFB8RpLb9HAJWgl4J29n8gg9cX3eFHeGvqXRktzphc4VNpfASiUkg9TzcF/nbSlqv2db3lYD1T2SzQxcE6nWBlvMqMLsTHH6QfRt4Ax2e2+mW0NrLTaCmbglXdbrYmLqh3RYvBKs06JtCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AxR8EfTd; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AxR8EfTd"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MF5qsu3072141;
	Tue, 22 Sep 2026 18:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dQh76v
	E/Ar/e6fmF/RsmccKs/8tylOh5Ck1o3f5kkzo=; b=AxR8EfTdNvuK850H1jZOkp
	MxwxwiWHfqowxJ6t9OmiRqsG078EfH0fnfY3pBzR8nNPRAVFcWIqTAm0e83f/LCv
	k6PaqplJTj0IXms7/O+yM2zvnU0qB0CL5NHm5uZJr31YwFPFPoog4w6nYOy3C++w
	beiXy6qrZk9LudF8KR2pEZ4Sa8Y5W5RjE+/n1v7OdWVLuMl1dUSQC6NRDim3IpzO
	ww+o7unXxej6WPCaM7ia/KdfjleA9WYUSETjl4uhZuE+iujyM3mIDkXrGzkQFMO4
	/iV3HKkLSVNHUs50M8sYMw242XzaAGCNfCfR2xPQJPotnHhfVssS/mte/o4aHksA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gske1q9dj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 18:02:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68MElbhj3046813;
	Tue, 22 Sep 2026 18:02:13 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gt4qqb1mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 18:02:13 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68MI2Drp33030852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2026 18:02:13 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0411858054;
	Tue, 22 Sep 2026 18:02:13 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57D6C5803F;
	Tue, 22 Sep 2026 18:02:12 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.70.9])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Sep 2026 18:02:12 +0000 (GMT)
Message-ID: <60bdd0019df887db393585f14c520e01599ccc3d.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] drivers/of: Add of_detach_node_no_notify()
From: Haren Myneni <haren@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Date: Tue, 22 Sep 2026 11:02:11 -0700
In-Reply-To: <20260921034430.359EC1F000FF@smtp.kernel.org>
References: <20260921033156.991481-1-haren@linux.ibm.com>
	 <20260921034430.359EC1F000FF@smtp.kernel.org>
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
X-Proofpoint-ORIG-GUID: 9s5aWuaDxXv3gLN8Ph2h5lMkJUNlFa1A
X-Authority-Analysis: v=2.4 cv=EOCTQFZC c=1 sm=1 tr=0 ts=6ab2c2a6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=zVZwimStdwy5hYzsWZoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1OCBTYWx0ZWRfX9XP7ZAXUXXjn
 s7J5zovduquMAuQ2AjuEMUfBqSJaKa3VGP5GS1ge80vLIJGrVoC8ThqBF9w3p9cjuBYGG+FQaQe
 OUaxp0B4XeGVENRHUPgOnEc1iX6i43E=
X-Proofpoint-GUID: 9s5aWuaDxXv3gLN8Ph2h5lMkJUNlFa1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1OCBTYWx0ZWRfX4ufqNfpVWOjd
 Dt9uL9JB7DXNPDEwetFuk+NKI3YEiklLam9XitJunL4nzd71r3JJi9rTc+sGnlkdN0Dlnm7+oAS
 ZnEF6wU3qqHbqiy6hMnCKbGq4xhjMo9byhuFTVKoKebneXA2TNIbO16K4NnitQjR6/EKWsqfzlN
 R5J36P80mj8MlKr7Pq2YUAY2oxFdyQE5exuJU4a1+qeWVHTJvDoRDlccUKzKxUq8a3y/ZDzndO6
 81Hwdq+Pq9m+T8gXs17HqpNaP7qxQP8q7WIq0857WU5Rwd/voCAPe2gJeTUyED0zqt6z0cvzpO6
 MsXw0xabCsr59HQG9pYCnLnfdxRBcjGUewZogfZrnsiXpFX0thLsAIiN+iVjaEQwkyQNqk+IB4Q
 O0+H1PdIw+WXzaBjIByvixeAoQUMbQ4MJMC7ChWx7d4TJpdjOUEremBIm0COvl6NumngWTmVHqr
 DXfdCJery9B+ROyJG4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220258

On Mon, 2026-09-21 at 03:44 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] of: resource leak when using of_detach_node_no_notify()
> for rollback
> --
>=20
> commit 32bc441a65c0469af8bda8ae3a3847daa98db314
> Author: Haren Myneni <haren@linux.ibm.com>
>=20
> drivers/of: Add of_detach_node_no_notify()
>=20
> This commit introduces the of_detach_node_no_notify() interface to
> allow
> callers to remove a device tree node without triggering the
> corresponding
> detach notifiers. This is intended to handle rollback scenarios where
> adding nodes in a changeset fails after partially attaching them.
>=20
> > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > index 744ce0e1eb24a..fc6f22371a97c 100644
> > --- a/drivers/of/dynamic.c
> > +++ b/drivers/of/dynamic.c
>=20
> [ ... ]
>=20
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
> [Severity: Medium]
> Does bypassing the OF_RECONFIG_DETACH_NODE notifier during error
> rollback
> cause resource leaks?
>=20
> If a caller attempts to dynamically add a device tree node and the
> OF_RECONFIG_ATTACH_NODE notifier chain fails midway, calling this new
> API
> to roll back the attachment will skip the detach notifiers.
>=20
> This fundamentally breaks subsystem teardown symmetry, which means
> any
> previously successful attach notifiers in the chain might permanently
> leak
> their allocated resources, such as platform_device instances.

of_detach_node_no_notify() is called per node and only if the attached
node notifier is failed. So up to the caller whether to use this or
of_detach_node().
