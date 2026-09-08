Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712A8569F2F
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 15:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882473; cv=none; b=ELEtha40mznUq3iFSguxm+9iuCZ1qNLYLnGlwVFIoM8Vd26UcZHQtI3dH2/QIa5nvENPDYDedr8FBj9lgaXhlLzIfk7jksOi+5IIuMyDjoiFCUqrjt11jeNFjLJKJWmUDHBaCf6VHQ+PGEUa3VTe9Fz20JaX8fiJ9D1jFjp6AVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882473; c=relaxed/simple;
	bh=JruwBrg6ocqnRLATYSQdb1hBUBob8s3+lpsva/v10iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5s45SJpgPmNcfz8MCtDCGoDbqfXQ8rYC6e6vL3kyYeb29o8jpYf9Hl5sEA3B3zzNtBg0l0qD5hVAH0ni1msPW5OVYeezbBoSJ3+KWhKYx4FcjevZ1OzbfBwz2n6UoIMzbnH6TrMCanef44pJKLIyN+Y/WlCIWemCOKkr5Rc06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bux6qWQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCa8lHmk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bux6qWQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCa8lHmk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdrYH3758245
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 15:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j22ngAJ415M/98LZb5I3VVp0
	EfCLQZR6WUczjgnvxYk=; b=bux6qWQuAxpFlbA4sTnkkUBs2c8uqI7YPXBXTdJP
	uExI9E2yvmJ5fHxqZcX/GNkn28WhWTV17qFddeAwNh3nslKyEZqA7ZfWZViy8/YD
	a97KnYEQjY6aIgnS+nvhc3Jw51kbkKWsqANICIEEwvArCfcLzaQyUOkN1vYYPmeL
	eqAKb4RbBz0v2iCrFze7Oy3Ktiz50rq8DlXsQdu+gXxNbJdWmTl10rveH7c+UpXK
	AKHzOC3gvJP5Ql04u6vGtDDt3h+PsFuejj0ULIxHvQF73ifAW8aGO7QAhHISoOti
	jUN/+eJtAc9XsZcgxhkObJ8KYkM0z6K+2Qo0y65Y9K/PeA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7jfpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 15:47:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7819910f8adso4102440137.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882469; x=1789487269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j22ngAJ415M/98LZb5I3VVp0EfCLQZR6WUczjgnvxYk=;
        b=hCa8lHmk7bJGZKXUttNzIipTnWQmKrGN9WAGpVwESDO8ofhBhOk0WJQyZ+IxGaxbCY
         nEy/zIWHOQ28oeJ3QJxZpTIK3NNrg/td65bMgvnfgT1k/HNVlYE1nJOqerCcuxBNjGLY
         Bu7t9QlxIlde+p27JAFD7zqYIdIx3e7bDVYLtPuAsZ74cFZmEN87QkDW/6oXQa/UHJ7O
         HH+ViQalF9Oie7SaUaEhJhEdOoFzOKtGva4NohUUdLKCWHiYz5KVLJFwjEAxg6C290bq
         QCrwysHOVmjje7J6UA42S6oeMDKZjDkwhQvlCsrzaF9qsqUHBfqPuDu4mwOJqmov0mqy
         SIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882469; x=1789487269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j22ngAJ415M/98LZb5I3VVp0EfCLQZR6WUczjgnvxYk=;
        b=GATtrkqNJTU+MciYzkNaXEnft8sBGsePRIXknuD/jTSbc87rbI2VCckBdGY51N8uRq
         Xgu6UNyv9GmvrUP7yW9g+LR3+XS58Ves++YHveuAEuH2I8tZB8v/FeEHDXON1m5mma5v
         ZHe4V/Ou+tQ6baIQujNCdW2mYwhFla54xJn5PZ35lxuLkABDpaiNT2lRBxIwM9N5WrZh
         SOFFyWp6qo/mxTFnKLQheFKR9RiL5ek5PGLRxuA1iVv/V1nrFoCeQ8/mtxtkChEIbt5k
         ei98fLsHfiZMiXNCU4/tsSaV2OljZ6TVCLLA9N1k2qPoPaScecpl6TSCqriaq9mfpq5l
         FJYQ==
X-Gm-Message-State: AFuF++lceybF0yww5vqthpcqQgV6ngDENqOwzl3chDHZw3e7xF+CZrgb
	PQ5JrwHki3Es0837S8oCqrZPrKudLgr0ND9509QI1QiRBbNfwPqRd80Rqvn1M8N3InHRv/XyErh
	eM0h97a9/+YxgTMR9ZG9YLlHKAVBeUebmeMctvbr4EQL3UySFl/xTN/3zj7Mb/cp/Sp6tCvv7BJ
	xzNJU=
X-Gm-Gg: AYBFou38ooxy2n1gs+Aby/K7L7wXd2bka8tW44VOOom01LnWBzLLGXsuksXvjmWlsPZ
	DvCfmFQwnz6Rg+hREvIXWamgzDHVLotFPwe34eTXPayNX1yvMdkOsQChQxT0QoYBSQ9EllVPgKk
	Ztxj1/cUXEKceoOjjmTVjYRVmTymx7bQU0aPDpywKNr0CK+0hkDmjzXg+f+pOYETj17SSVFK39d
	N3E8sRaJbg5iifbrrEPqElvhNEvjt2v+uGjeZxnv9LVVr3MeBbeiEOCxhwbgsp+BE9Txzog2BL4
	6pCyKBfrcas/kErOINLfuFUjlOIn4TkGB1fmZH4pt31wliBXVNiN3fqq1OlZ+EC9TidRDHCmbvC
	OhOVMMbMZbrbRpQ==
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr12518786137.9.1788882469388;
        Tue, 08 Sep 2026 08:47:49 -0700 (PDT)
X-Received: by 2002:a05:6102:50aa:b0:77f:9278:af6e with SMTP id ada2fe7eead31-78a4aabb472mr12518759137.9.1788882468775;
        Tue, 08 Sep 2026 08:47:48 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm500620805e9.4.2026.09.08.08.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:47:47 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:47:46 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-pci@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: PCI: toshiba,tc9563: Document
 embedded GPIO controller
Message-ID: <aqAuIjzyZDqatLEf@lore-desk>
References: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
 <20260908-pci-tc9563-aux-v4-1-c7fc7778292b@oss.qualcomm.com>
 <20260908153429.F3BD21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4rhpS0uzaH8VFat"
Content-Disposition: inline
In-Reply-To: <20260908153429.F3BD21F00A3D@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa02e26 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VabS-W3W6dOqDnpvnaEA:9 a=wPNLvfGTeEIA:10
 a=cCukBUQwQ2FYGauE-EYA:9 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfXw52+w7H+IFw5
 7lswjS741vim4tAKdJltAdUFoiSaNYzzg+EbUx75LxiCqp0IVEG+e4lcqLVgn4pxpd5C1glhGeo
 fkGs4yolJp7QIlDEEiq5ArU8NIKN7pI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfXwZNym9u2X9cp
 9exTSIjrl5uvKKnsCOc4SBKYJClGbITSex/HHxN8J8TPGkeRM6Jc94Ln/3Y2x3TJSk+5ckMjF8T
 jy3qfs/xRa3GOYvWI2lgI8yUS2swxNcmVdl76kZkSMl3s4K0h6uTGygO+7e/Sq9GtWKARxMwMN2
 0q1gI7R6piuTsk/DT8ukIW9YeT5Em/MvKBiP7D2ody7VF0TpT3etxHJhzdIGyqNQ/euVjZbUuPW
 z93lZKQ0yYkb+yuhCj5jA7krTKUP06TAhMFp2bDqI/B94VnvfGyvxuMGyQGB2RmyCjIttXfL/A9
 0F7Cjh/5iEWV2zXwvDF4MWCJDuE6wxOQKwfyR31QgD2N15PjXcYVtkCC9bjG9bSbi7M0h0CjULd
 WDUrAtBXW08dmTcWVYzLyD0OQHVr5Tx+GaadIP8RWBN9iCjMurfWN/NT5nCpk5yMuQDPbtrh3GG
 2++B5R9yul2ETVrVtkQ==
X-Proofpoint-ORIG-GUID: xF-3wrqtE9BK0KW5d6VV3m-4fLb_GnR3
X-Proofpoint-GUID: xF-3wrqtE9BK0KW5d6VV3m-4fLb_GnR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080170

--v4rhpS0uzaH8VFat
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The newly added GPIO provider capabilities 'gpio-controller' a=
nd '#gpio-cells' are missing from the schema's 'required' list.
> --
>=20
> commit 6d6cb30a1eb86b847e98eea66d5ba6cc77a091a7
> Author: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
>=20
> The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines. Describe the switch node itself as the embedded GPIO controller
> and document the per-port reset-gpios property.
>=20
> > diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml =
b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > index f084830c6d0cb..2f03e4e45114d 100644
> > --- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > +++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> > @@ -31,6 +31,11 @@ properties:
> >      description:
> >        GPIO controlling the RESX# pin.
> > =20
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
>=20
> [Severity: Medium]
> Should these newly added GPIO provider capabilities be included in the
> schema's required properties list?
>=20
> Looking at the required list in
> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml:
>=20
> required:
>   - resx-gpios
>   - vdd18-supply
>   - vdd09-supply
>   - vddc-supply
>   - vddio1-supply
>   - vddio2-supply
>   - vddio18-supply
>   - i2c-parent
>=20
> If the new capabilities are omitted from this list, device tree nodes mis=
sing
> gpio-controller and #gpio-cells will silently pass schema validation,
> allowing incomplete configurations to enter the device tree.
>=20
> At runtime, dependent nodes (such as the downstream ports attempting to u=
se
> reset-gpios) could fail when the provider is misconfigured.

In order to introduce any ABI change, we decided to not define 'gpio-contro=
ller'
and '#gpio-cells' properties as required.

Regards,
Lorenzo

>=20
> --=20
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260908-pci-tc9563-=
aux-v4-0-c7fc7778292b@oss.qualcomm.com?part=3D1

--v4rhpS0uzaH8VFat
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqAuIgAKCRA6cBh0uS2t
rDE2AQD/3FoEIT8ZWA+nmc7XAWg/ismfF4qC4W/Q8+Dw8L8L+gD/SkTTEEhXw39X
eGdtUcoL9OEBrhsJtZRU6OiiAGwr7wY=
=HGTa
-----END PGP SIGNATURE-----

--v4rhpS0uzaH8VFat--
