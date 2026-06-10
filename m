Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD9731282C
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082084; cv=pass; b=DP2C6Hqm9TJv+KHjDDDxMga44WxzXPAZY9cUkUv0C7ILLcoVO9OYZhiYRtRNpAfSm60ZSiaeQMrQWAHWQEtDbJsB5D4POJf7CgmAYcFpkZiQeWdOpVdYVlxWngjkljBqxbipUQKMso4Hk25qVQKuF0D5fgF+301aX1PEuqhAb+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082084; c=relaxed/simple;
	bh=ygdIc/5cpQph1AaBtGCq+v9bKpdzx46UniyIDnMjYws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmZfl+kCiCUaO4tK8mdMIJ+9cXfMTuNnNI/9NSwY7C9UK2f970QiKZllX/9MVBdzJywCM57WmHoj62a/+DMJCNj2BdzR7gcK6MEmN3gvBtdMgS4LdvDMhsJW5eokIXXJR+z4sKMKQunJRrR8AQ1fyV+gCGJ7kXWVdGA+uoNwSBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nR2HWt4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahPzbrB/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nR2HWt4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahPzbrB/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hmrj469535
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=; b=nR2HWt4M3gjNzZQn
	y4goQ+Y4ILHumR7+UOjs8u/yx128NLPk3ij/JkR6mbAvO+asUox2H7uIAuzcbrxZ
	NoICkgA143UJ5xxmikvQzNCjitjoWx/IxHquQNH6OFuycf5YFu+SnQS216b2igDk
	Xqqxb0MRgNEoe9cu/SfYWv0Y+l3d24FtFwS8GGMs1cBbUs6saEz6t63/MCmMQHqt
	bzuk4z/WxhsMGGdmfj3WTenJBza/N8QawmXiewtWccZMwdg72adf0tDLsO8rYd+b
	UMFlifF+wq2mYBL/x+ULAX7CDRmjvstQ5dewzYhhtDoYSkkWfZiAhKTwvtRq0nhS
	SN5SRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvhcm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 09:01:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91571300242so1557487985a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 02:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082081; cv=none;
        d=google.com; s=arc-20240605;
        b=cPyvuA5L4sgB4pdlQJYSe5Oz796wVIuMwNbqFp6KN5oa+n3evZjnaYYc2/PmoRqkMY
         ezQdrlOAJYnaqu1zyAPMH91QY6S/FJl5nfxoAVllF1C84NNFrLwXxeyk3m8KdrgVHVJt
         K6lAMGtnn9Fk7jO0NkE2AeRB6gDuDDm2cuScy/nKUGnLoG3YAQdOtvb/5nDFOBXEhaFz
         ghIW+h6YGabNVYZd0k+vLon6FRaavdGj1bHIWlvUXOSd5Fe2UrUTnAu0q0GlZ1nlyTeg
         D6lO7uds1YXJBNHjhCL/V64MyNiD8bSox3KblSXB0j1Sa5tKGMCcYP7otVfAZSJqc6Ou
         miGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        fh=7GxT6AgM+OSdeHuXmSo3V5s3HyVgxMqUJs/0ruT/rZs=;
        b=Gri1y6dkNe8jt9nk1WF9MFezEaEEmH7QRzzhTc+RIomBAa/ubHqzmlqxgnDYYd4OnU
         maNUObwi1Olclgrp+/jrhu+7eCEi7EvZyQfT59WGSQ3jlgikCZTn3VS0EpT0q4nE5LIY
         6Mz9iZAj9VUZWqnAJj/MN4Uj8G+E+4aeC8AeSA3uS5qCakuFpujp41F72Z1VOQFs8r9+
         eyeHTlS+cE1Q/XCbbtDRbFO9CAYCSBSgkgOL8oPs2kImmIv/Lso8PNoo4e5eswmFvM2y
         J31HgFYPf0iu6TBN3KwClVdkc4KQVORzDHoRyzF7u2MRlzteyNtzT6acmJdoH8ey7FH4
         vE1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082081; x=1781686881; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        b=ahPzbrB/nJXJ6/MIc9KXQucu8Y/Sp6x8DDl1w3h+msizVvox+Y6zVr/eSU7v/CScQj
         xFOE7TR0z57cKmWI5vdzGstLzj6f7++sNOaRhxP9Xj7WXtmNOSjDFl41bMtJ4u5n8odJ
         om6ZnG9/nfZi8VTE4f6r2heoAjBKWoyXVzAZwr7+/Nbv2SVDdcIoHUloYb4vtYThE5zz
         +r+9xyc4PSvXMxk+loecLJG/hmmAna1W6ZP+axzlOEf8ThvARYfw9pxFtkTjoOjQwxCs
         eSvhF3ai8ClSM8H1SGCYC/PQdQo2RwDMamd+PLooAqtlXwft+d5OYiLH8BiDT01VqCfI
         IXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082081; x=1781686881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        b=ftOKVX7106tm3t/DCRgkQNm3fQeovim00qkVDFQdkmYfHG2Qr7jvKXTsKjMQ0m+Hyi
         81saPEAgh6cBpwkaOC0SMQZFXTVSh75SnySUjW26z9IxbeuJiBHYCDTCYS0J8PD09spy
         63y44QdYHG2WZxQCp+m12LVMb9WlaeNhUP5mdtY7XoQw4/veUuW+LrfJeLXfAPN73zSq
         w1SE5gu9BRlI7lsa4DiyNNSVPvkArF8H4YXemaNC3MSAWPEgjjMjk7K9+rnPrWyTBgg6
         rWKPPjP3xJ390s57j6W7A3ve2bik7MQT7uLI0ckjbhF+VoVUURkuZtHqNpyuiJu+hQfF
         Cc/g==
X-Gm-Message-State: AOJu0YwKRcQifr3hXVV9aoxQ+LAc7XComIm9XuF0Jy2YcjtiLzO0ajFm
	m40X3+BK3+3GM1VKykOmL1zCXVa69cHMCyZYulTn1xTwIpfbfSC86KbE818O50+5A+LpC6k/AR3
	iNaKVtYcczirdYDwTQtP2+k4AafpGsoAe7ucnuLTAlT604vZes5JRy/yMxaBy0SSYqH/nUGaY/3
	oI7m4Wc+NzKn3CbAda/txss2v83MDwQmlk7Z/ytbJQATeknNdFuITnLA==
X-Gm-Gg: Acq92OFlkcPGJckxfZEsYCa7/HtzaazVyExLyQ+NyfqrFmetQXJ9qZ3sWtSz0ewBsHX
	gbdMIGmYYbQpNaj5APFAd0Odl9F23jWf5dASYw7/4EOVRdKr35+wrF7i7cDt7Rq3N6JWKmhtDs0
	tROcPDxOE+QEHtx7Ruqdx1eGw+r9Xv2ZItRTucwcwUzdnIeqy8q4e9pAom4gAix5xAhoGUl8tKk
	KywUveTpt547YLNupoEhL8GlWr0CIr26ZtPLvDS8zeU4RgrKrsRa6ggZjarR93d82EMp2mYYQc4
	Aq+mYsA20b9mq+iFsOlni8/MOSUYc45F
X-Received: by 2002:a05:620a:1714:b0:914:bdfa:c782 with SMTP id af79cd13be357-915ad2f6fc0mr2781877185a.29.1781082080824;
        Wed, 10 Jun 2026 02:01:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1714:b0:914:bdfa:c782 with SMTP id
 af79cd13be357-915ad2f6fc0mr2781872285a.29.1781082080344; Wed, 10 Jun 2026
 02:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com> <20260610084110.95B9A1F00893@smtp.kernel.org>
In-Reply-To: <20260610084110.95B9A1F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:01:08 +0200
X-Gm-Features: AVVi8Cf101Etup7zdHfqr_Gk04nLmdhi5b2-2xH0c7qSlPjn2aMb_SPkRj0J0gA
Message-ID: <CAFEp6-1j9Mfo42HRUQC42uFZRtLU+O3XNQToHDbtztCcdM3zgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: r3jRLE5CPmvXYf-zxXYYQizubcmcvP9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX7sq99hWKiHRI
 ciuw3VdXHTFvGtgZSM/2JN+uX38nLYLe4W0kvn1cUB9SgyghymS/+UZ1XAjW1UhJaVQubHY2pV9
 zupEVkbQ4xUIfIHsalcS8mmjROxEQPG976ckcL3RsatceieFmAzfOOfzg4+ytq6MXFiSindej1G
 kAvmIFaCSIUvaDTuN2zW/WmrixaGHwCGu/UZZ7Of6NFiH+w3BAp39YBzTTq1//Rb9CA23VDGL11
 q1gGn0Fiy54q05efVDOdnYaRTi5L8PlZlHgGJuQiaYHNuJwQsx0KQjMJhr1LtryEepNixaLF5ex
 IAKqn0KcLHA6nrL8c1VxoOrSiCorQAEXM/2gdijwKiP64SGvvyAERu+eTv3l9eaa30i87AfNQWS
 L+R0bSlHb+paYlv+f0DoIShXFOmBMODWfWtKyVewXCx80jJ6EcISkfdl5W2zz4DNuXUIWkAkmtN
 uQbp+ZZhkgAalr4E4mg==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a2927e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=FtrjkMYBM3xUHZKazO8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: r3jRLE5CPmvXYf-zxXYYQizubcmcvP9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084

On Wed, Jun 10, 2026 at 10:41=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The `ti,ina232` compatible string was added to the top-level enum=
 but omitted from the existing `if-then` conditional blocks that restrict u=
nsupported properties.
> --
>
> commit 3cd10611f4c71e7280e19fcd316cd7a918042ee6
> Author: Martino Facchin <m.facchin@arduino.cc>
>
> dt-bindings: hwmon: ina2xx: add ina232 compatible
>
> The INA232 is a current/power monitor from Texas Instruments sharing
> the same register map as the other INA2xx.
>
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/D=
ocumentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > index 009d78b308596..a30888c9156b9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > @@ -28,6 +28,7 @@ properties:
> >        - ti,ina228
> >        - ti,ina230
> >        - ti,ina231
> > +      - ti,ina232
>
> [Severity: Low]
> Does this new compatible string need to be added to the allOf conditional
> blocks further down in the schema file?
>
> By omitting ti,ina232 from the exclusion list for
> ti,maximum-expected-current-microamp, the schema might incorrectly allow
> this property for ti,ina232 nodes:
>
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - silergy,sq52206
>               ...
>               - ti,ina231
>               - ti,ina234
>               - ti,ina237
>     then:
>       properties:
>         ti,maximum-expected-current-microamp: false
>
> Should ti,ina232 be added alongside ti,ina231 here?
>
> Similarly, ti,ina232 appears to be omitted from the conditional block
> restricting ti,shunt-gain:
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - silergy,sy24655
>               ...
>               - ti,ina231
>               - ti,ina234
>               - ti,ina260
>     then:
>       properties:
>         ti,shunt-gain: false
>
> Could this weaken schema validation when checking device tree nodes for
> this specific hardware variant?

That's a valid point, will be addressed in v2.
