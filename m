Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A063C063C
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139127; cv=pass; b=DytWnCBYJ1tGTNHNZ0oPjNUX615rkQOrTN/nFAzN0OEjcMxJVZADtknqypDt6MIgc+FhchnZLO15rN1vqvFGNifvlyeG1iWHNNaZ+OXg70H6g1nV5PGxAuErqkPJHl3YnIOFFOqUx3QH2EOuNyNXsV+JReL6cX0LQ3G4vHi5po8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139127; c=relaxed/simple;
	bh=Iq8Z3gsY+sGh1bpm3OsF4CiOccucJFzJwdvelyBxEj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmMZSbUTQ3kar/g2zNvrVAr/WD5LeSdn1R9fV8S2bcd8RE3CzBnMIy3HXQH3g11kAnXoocaWcbGCDiRsneTPaRjhHZ+h0gH7ynhbNr0sGrnprGTCC0tto5ZbRlrSUV4AV2oPNWtLQc30j6IZXGfYinJrLAp2RLrTFDIirFnrjwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMQc2NHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJoUeLL+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMQc2NHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJoUeLL+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2NHOH3902237
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iq8Z3gsY+sGh1bpm3OsF4CiOccucJFzJwdvelyBxEj8=; b=NMQc2NHbmVHoBxFr
	uD5KqQWYTYkO0//DD0cLR21xMKAyTUFaFtjUhb2iHScRGHbQc35yjtRtQd6zkIsp
	6sAO1Hs5PMBcmkRO5LKlPd+tbiKH1ShucqXqdnqqA57zFo9dr/zxpiMnY/Cu5TL/
	nf0xAap3U7MZE1RMHNnoFsf8/VG9il/f+cyB+IAgSkew7NRZ7vIGOBJ6gp9G+DW2
	Vmf226P3zXJVGlMc/BGi1XeXwm85IBFGbulAeU9KfvFjF8J6c+ZXXA7D/IWE8tsU
	5kfnANBRL38SbR7H/hu0yvivOg/Nad0nh9U2VqoJfErfidsVQAD9scO8CIWpe1oa
	jZcXmQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sett8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:25:24 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b38ea4c6acso5403999b6e.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 01:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792139123; cv=none;
        d=google.com; s=arc-20260327;
        b=EzH9YCs5aywuf8eJkIvDXWtZIxtA1j15H4aTJifp41VaklKljOhSYK8fshz+tiu8MB
         iqzHumhlkNSqgTnuz2QDwU0c7wyxymJJiAzTm/jUS4xI4bzTu7eS/BjlL6UF/QjS5CiF
         9fdsG+zjMq9NEskEZJ0d0tl+RXJfh56CulvPInjHOIeJ8HP3E60+Mit9G1Qiejy46JiO
         RJwjByzzgpMCFHJDiDvK8ME2aScO7j0zqMxwZOYNNrMFdrSDCg8etsJqu3IBUhG0OhtB
         hzcS15+EWuPpnGSnK54XH01jTGNEDGu04WkFVvXsSsWwvToi+00+1cL3DXKW+qlw89it
         6k4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iq8Z3gsY+sGh1bpm3OsF4CiOccucJFzJwdvelyBxEj8=;
        fh=TteEYLNWz69Rnwq8zlZOwoS/ljl9yTioyU5s8o5BwCM=;
        b=fgUF5ndRf+0a1z/hMWHhMqDhyyC0GfHbUhRClC+3K0/Iuq9i57Bb6xURCwOzFtFG/r
         b16IM7f/gOYSKC/kVaDvxh2jufj8GEzBYR0a+b62q0ko1Poo/KdiiPBcGZe8dGWuU+q8
         4Wu5bte0SUgowT1ouFXczyPOXCXBK2Uf3CcEVzKZ1p8/fmMFCT5IwLMlFmKXO6OGzeUa
         DOuzv4gIVInHfhSeUZj82B6LpyDKLgfvPX68zuXrRWaNMUU6EgqtmfqGietQvm0KWB+Z
         L4z3L/o5EcqwWDyHhbx+1SpX+qpAXyRirS8VCp5sOjoSgLR7M/AKGfe7T8v2dt6wY5bD
         pvEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792139123; x=1792743923; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iq8Z3gsY+sGh1bpm3OsF4CiOccucJFzJwdvelyBxEj8=;
        b=EJoUeLL+29Aum8hvh7NYyHSVqVk/jYm45WdKw8Q3wMDlyrDpbO0EqvOHnlKrR69jgS
         1dfvDWQtap6DMYkI/tGIaz5TzBIi0YEcFzYlhPsZ7rljv1xOHETR5v6yLAaXuBjL9XOf
         e3sZXwOF4ZgQOiDHXLjEpsMvCdNI1JAAZ1ZcYylcfLt4/BxQMyMk8HQj35L2aZE0y68J
         gWLtXoY/VWcW4LTo42s+D/p58MntTowuHcIBX9jwU7plyEJxSavAGLm0pfCst27/W9cA
         dX5x3Ch3DQ70+GnIB4y+kuo7oIxtU/zJUmarKXMfhFZs0fL/oPtYzRs5TgvkLz4RIotc
         zTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139123; x=1792743923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq8Z3gsY+sGh1bpm3OsF4CiOccucJFzJwdvelyBxEj8=;
        b=uvYumlxivZJdlxWM2Aizr6ddlWmQ5dlREnGlbdWB9gGQ0haOnLgYr9VaIe2q9k4BmV
         Gdy82sTsDQBxr7tMvYos33dVQryh2VbqoOh2qH6x0rM7jKLs9QBRDvLbbFiyreNDrtlh
         5WBlXuNMPP8Ilj+IUQrSpiDpzgNriJv9OFMbIIMo7PnJcyiLDH0dZUEQFNkweyI3g1wE
         Ss9t+ad6Sa/UTzTc+wxNppwzseOMa5R4MhI00msAXqFCkDES7oUlm8JUgFng2KMu1y7W
         RMdmiz3oe2Qafzq1HTC/vYZvveGkFTIX/33le2EpSqU37Bn6vR7pZFuZizNUXkA+mURQ
         JNIw==
X-Gm-Message-State: AFq9FYKzOxnlLMEUIBsFemQ+snRrLvFtwoSvHNGRQ4ubGZwO7YoLgC48
	qovTtPXStwnOaVusMY8tcAhxdovbdslLg8IYOi/4KSLCCvTaPGw2GdpctVmk1S2YzQmwOeMTf/h
	d2IkDgziHosHUFE4SaiR4Kps0EIUlIz4iNdRKzRHhHZeLfGVk1dE4L+gStfOM0kQ0mflRfTtV3E
	qZXEBqnCeSLpaaOW38Be76DEPzfZSa0yVIEaYYuO+jnftj4g==
X-Gm-Gg: AYBFou2ykYKwJh9uBC5SfMLqcQs/jjKO+O/BGpjs86gqSKEYCBuILEJb+V50kL1WEG/
	BJoWJzs9kXy1RSmmLy3BRhGrMBniuX308YtRX7xpvFl8SpfqmEx/dX23BTsyzjunQ9PdYEwcDqG
	CO+rkTiAHAyTOqDhJvDGTN8J62d/RqwxCEc0v7KgiNNfVp3qQ/jW9bWPhUdg==
X-Received: by 2002:a05:6808:238c:b0:4f5:4ce8:7e92 with SMTP id 5614622812f47-50c57a6c3a4mr18345499b6e.48.1792139123354;
        Fri, 16 Oct 2026 01:25:23 -0700 (PDT)
X-Received: by 2002:a05:6808:238c:b0:4f5:4ce8:7e92 with SMTP id
 5614622812f47-50c57a6c3a4mr18345487b6e.48.1792139122886; Fri, 16 Oct 2026
 01:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-pcie-ep-rpm-fix-v1-1-855d56cce43b@oss.qualcomm.com>
 <20260925103254.EC98B1F000FF@smtp.kernel.org> <179213121447.63727.13789617751814530058.b4-reply@b4>
In-Reply-To: <179213121447.63727.13789617751814530058.b4-reply@b4>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:55:09 +0530
X-Gm-Features: AclHuK8m4tAAXjLUvVUKmZo-NlAix7-61WcjDcYjmd4-fIRQLamokUamIQKnbCU
Message-ID: <CAMyL0qMRk32yT6kGH+AggGYAN1mGCWkR_gzuuBdJ_XB7AarNdQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom-ep: Clear runtime PM error after
 pm_runtime_resume_and_get() fails
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 0hwd-zWhj9SWvifDXZPPUnxgnOvyQC8S
X-Proofpoint-GUID: 0hwd-zWhj9SWvifDXZPPUnxgnOvyQC8S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX5MFmSHHv9u3j
 +fYZEDqJ+z3ysrPWs+Vyyvivd+k8DPEBAa+Ue8X1fEvnNbkm80bNiQ9o8j2qjRfqKdI2NR58bX3
 EY3gwz0Ejarrf9j1sv1SLLmTpS89eWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMyBTYWx0ZWRfX1JnGfL+m212S
 StVcj4mKxL/Jldv+MbPU4FqzlPSryRwlKk6OtPlgfYm4l1dHsX/9BzcWhcTcgKoJuXMaIIQBtJz
 iB7/64qteJ5a7gd+MGJN1a85R4VsFAYj7flqKUww3b6O1gxXleddfLyF9a0CKpTNUwotMQZOjUD
 BWp+WgBANQbZ7Hpf7G+kCphGNnlCGNZTryZ19qBWzaq+ixJBYsmddb7oy9u7Mpm8U79iUnc4Tle
 u2MsT/JbwRfgPyeOHK74/3vrQqS4eJ+MrfdwwIImtNJMkbC/uoyZK/doFqDO6virb1lq26tNgdp
 1IFg1BmGwpUfLQAlUcvGyy50TaiF2+Xcwz2l74j+2gS+YHgVeFF9lxVeTepCUDBjHzZjRRlUIJC
 jLHMvHDa2icmvGYUurhSQBQffHhaEt46Q9bwVk+NB85SdIIY6xQMHZ5/svqb9qmLHMnOxOuD+9z
 x5pm8p2vTXDmBRDQAyQ==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1df74 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vol8GUgx4u-2tnQQBp0A:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160033

On Fri, Oct 16, 2026 at 11:43=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> On 2026-09-25 10:32 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] pm: ineffective pm_runtime_set_suspended() due to false runt=
ime_error assumption
> > --
> >
> > commit 3d108ba33ceb10b064e31ea4a0bb76a46a7b974e
> > Author: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> >
> > PCI: qcom-ep: Clear runtime PM error after pm_runtime_resume_and_get() =
fails
> >
> > This patch attempts to fix a runtime PM recovery issue in the Qualcomm =
PCIe
> > endpoint driver. It adds a call to pm_runtime_set_suspended() on the er=
ror
> > path of pm_runtime_resume_and_get() in qcom_pcie_perst_deassert() to re=
set
> > the runtime PM state and allow future resume attempts.
> >
> > > pm_runtime_resume_and_get() sets dev->power.runtime_error when a runt=
ime
> > > resume fails. As a result, subsequent runtime PM resume requests fail
> > > immediately until the error state is cleared.
> >
> > Is this description accurate?
> >
> > Looking at the PM core in drivers/base/power/runtime.c, rpm_resume() do=
es not
> > set dev->power.runtime_error upon failure. Instead, it merely updates
> > runtime_status to RPM_SUSPENDED. It appears only rpm_suspend() sets
> > runtime_error when a suspend operation fails.
> >
>
> This is accurate. pm_runtime_resume_and_get() failure is not setting
> 'runtime_error' flag. But if this flag is set, then further pm_runtime_re=
sume*()
> attempts will be blocked by the PM core.
>
> So the issue this patch trying to fix is valid, but the fix is somewhere =
else.
>
> - Mani

Thanks for the review.
Yes, this issue was recently addressed in the runtime pm driver itself.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/base/power/runtime.c?id=3Deef1d74bf88f120f4f63a83a5201fcda67bf3b52
So, we can drop this patch.

Thanks,
Mrinmay
>
