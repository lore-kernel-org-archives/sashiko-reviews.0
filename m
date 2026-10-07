Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3DD40BCA1
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386007; cv=pass; b=oKyJrozORJFPWaNwEGDAmequzYdNsqVez3jObHAoNKJZah5wpfwJinQe8iPleUYWFJM4i6ngOyNeDv833jh4mNvstXggzRJVYmwnJkgXrzDcpaIa80XlpB6n2/bZ5GEhWIDRGXPc9xOWjQq6w3Uy4XKid6H+en1MtPZLFEabfH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386007; c=relaxed/simple;
	bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGs0maMwNIwq31WieevytWOL5Qa7nz06nsJMEzxctfDyadGI6lJCw+Flinixlr2OH2E8ZBuhlzlYX0JszKCAo9gBYVklaaNGQywO1vlYmuG6MI6L4ayBqEfGtdzFNnQd4SkIxZEjrxDYEbaz1AM6RDrwweO9u3VZOjpGuHpQymc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSi98iNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZH4wcAWW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSi98iNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZH4wcAWW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697Etfbl3909073
	for <sashiko-reviews@lists.linux.dev>; Wed, 7 Oct 2026 15:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=; b=kS
	i98iNBmpK6Komj36szarrvC6suf5CZ6Kh4dWhgWXLkJV0G2t+T6qpoKtysNp++3W
	WwU7aaKSyy23XxzoNCgSgrGfSY3JI7mO6jnnDNdRuTzRzpRvDmLOz8Bqu/LIzyOW
	4ez2LJUjPNvThA0bBhKHXuD0azIyDa82lU7GgthU8JLqda60ozoc85hwHRUxhIjx
	/+xThhJglZUlX8gBMTrSxMujIzO3HX959eQ3Urfx/gxgTiL4y+Q+v8Eg4XBjygQA
	53rpeVrMxoxRXi6I6n6JDOzNvQ7jXUecS3YL8fm/BC7fGrhsspy+14LGX5Hm4kRE
	aL59suyZS6LmvK9RavVA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c67ap6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 15:13:21 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81b20bea169so3903079a34.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 08:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791386001; cv=none;
        d=google.com; s=arc-20260327;
        b=GG1yqNkVVOdzOCJ0LVB8RjVX0VBSDzEfZ56IBJlqrH1x8sL4nIe1+CfeyMJm9yxYba
         sd+Gc7Y9JQpkv2+T4v/9YyVk4Lv3LuoTLHo9kO1fSzYgc5M1n7cr/r7MlP9tOiPPEPb9
         zHENGmNxK8iddl/9vRTbwjh+Ios+L3ldTCcdDxWV2DmbwchRumYm7O60bLrrc8j+IcuH
         FPZLzFSaQJsqo2i1XgcZ+BHZB92YbvMevXqHyvF6rEVMVwQVVu8tvIArmSTILqyhAFBu
         YkyBjqotiX95cS+yVv4JKyffXrXeAAq+I0Kq7pEJblgwVVjls7Qc2cyRH/o5L4iJgQOy
         CcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        fh=UK2y+21//5URiNrnA0tm3tTV008Q6/xQaADiU/bio1w=;
        b=dAG0EBRTXrZY37W5QtK5WWarnNWeyCeE/codFZa93xRGb6TLHGDaZv8TDz8vQVW4n/
         +LxCLwDrZhzu56xRMN9RkqljOTEcybdwn8rdWbdE8TbIt4O9uroqePV7/kr1vUH+DF5L
         +NCzZIouJ+V2LdOH8jsSKMbSIEcQaENi7UKjuedVoP0Qn+uYEOFBH+f3eOzAdJv2yNS7
         pWkDxPQ3aTNAqRis/kp0QwFO/FFNIQC1k2iT9Q6nansV4yQZPbfVQqybE3dNXcoOjmtn
         WxiRyV8VnbG82e5VDe8kRu8/TbBESJSPey9MIgEm3W1II/h7pD6YINXBmH+rjk2Ry8Ym
         fpIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791386001; x=1791990801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        b=ZH4wcAWWr10X/vG0w5aBe+LLRl3Zwdclhj0hwdPYyhmwc0MmZZpAhxerWAMvTuBKpF
         QEUHIiZ1JgmncoMnR1IPI0WL0QhHjqo99I2jM7EBwi8lZeYFtGECZy6bmpJ/Fl5FeZ+Y
         6/YaOEsxXyn8KAtuxUp7jTlH5mkVHctCoy9Zf5rLbCelaFtH98Y+iafPSmrZXC0Whmo2
         bhbPNIVyQo/mYsf4nhgl22GVeJCEi5wJs7amTMQZtoO/QV4am3r5T+VxfXjpiWftgm+W
         doXUqlNJt0qFiv4wvdou88ey0RnlDsLMvTO9JFw9PBv+xtR08DnjOHLQiAsqRXG6Sp+G
         3a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386001; x=1791990801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Y3mvlPgWnVhVrSmLRzbDGbZ/FvqqdhHvWuSdDemWX0=;
        b=NEXjnk2yatnGIbMyMmJ2jhrO9Bnrl3GAW+dJUNHvyfISVUxcxWE7Q1iEqrue6cTd2I
         c4SSfM3GENuLxwzkLjHWSeVAd44gRpfuhmvxOgwpixhEoKUCi6b1H8a6cqNMdiJEFjtE
         5+EBJsZa+9VupSf+cuGYkdbGIiWYdAOvmX4DJHX10bWYiBemytsYb26Io2HK8rVJfEQy
         SPvM9aNPJLY1jrodnct1OAtxBG8WN2MvAyw7HYife9HT5/GE+c5E+c/3wns8/+irOJ9A
         mpIFutzrVpzRSOWLmXQpa7tjOcHm6OyzJY6TZKGox2bRui/LBymkmN5uXM2+di1okZaU
         X8AA==
X-Gm-Message-State: AFuF++mO5HF1m5WOQ1LaFcU6Z+DBPvq8FD5rblMiaXgGgj+YZ27TzSJJ
	jlgAntDuF0eoRpCxSJJrLwbuD6ioTFhTP6iAtAZvdjQTYwzSFI6TtaXqmmfjrnMtO8F0w2Phs4X
	8CeMdHRK7+nViBJ53bTQXvuaeY86ROS7VZ8QBLrdZdBTqXQS5nSN0ndA1VF2dRJl6e2A01lgrwz
	3rmtlu71Vf0VbbJAxpFbIubLhPxeatcAK5HT7CB2oDKI/wlw==
X-Gm-Gg: AYBFou2RMMnjYVOQRp4dfCTsySr1qgWCY/mhAaGdUCBrvAZkNuKGZ3hJv/RYDKEm2BA
	iXG7gc9KPc28dq9+Hxal5bLCNqugyJRKzLTybGGHYPwtIxkvytKKhMI1THfc9f2GO5kYuDom2dZ
	KhaRBiZUMJnNZuyfKTT10rBKv7AduY12Iv9VzVxET5UJMDm9Pn4Ivw0aD1
X-Received: by 2002:a05:6820:200a:b0:6b3:61fa:102 with SMTP id 006d021491bc7-6e7a8ce1653mr2316136eaf.34.1791386000861;
        Wed, 07 Oct 2026 08:13:20 -0700 (PDT)
X-Received: by 2002:a05:6820:200a:b0:6b3:61fa:102 with SMTP id
 006d021491bc7-6e7a8ce1653mr2316108eaf.34.1791386000412; Wed, 07 Oct 2026
 08:13:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
 <20261006131000.81501-4-robin.clark@oss.qualcomm.com> <20261006131920.6870D1F000FF@smtp.kernel.org>
 <20261007051924.39963-1-kmehltretter@gmail.com>
In-Reply-To: <20261007051924.39963-1-kmehltretter@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:13:09 -0700
X-Gm-Features: AclHuK-DPg5smaCdEYcgCX8G5Ae8CeG9zJ66mUOBvXkaQs85IPOEuKUidxy3v_Q
Message-ID: <CACSVV00nzPAOEe2yTrt1n7_fpQTLmdxnP34Mm3ovG7rKZsnbTQ@mail.gmail.com>
Subject: Re: [RFT 3/5] drm/msm: Extract out map/unmap helpers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfXzsMACdL50+RM
 mhLl+wIL2FOQM1J+qu3TiMbpoVsmzcg9JT3HegnqBz5VKYjtrS0JqGoCDwTK0FHEHynmDbHuMHh
 pdF6ZbDVXK4xkG+fVvKFBGcK4k8VG+M=
X-Proofpoint-ORIG-GUID: SUAIKp-04Z6NL1Q7P3STs5nGSULEY2cI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX8lKs86trQMzr
 PuDimSp4Dn93yq3n3bEYAx3YesSjUtI2HilQ/QulZzMh+EGYIKThl17FGeB2veu1ytH6ln+f3xC
 WsfpEDDiBDZG62YYW25Vg8Vj/bKaaLBMdQSzuGdpIBwxudBZUbTJ5EZ5gnrvQa3BGSSXX4MjqnV
 TAyNXcbdB+ytJpw57br2CYfvc2fe9UW3KPHVKiS2ZZ6RZhKL1L53n5ybf32Pe7XSMsksypSsEEr
 7C8+HoIcPfVC/j3rQOSG3ssAi9Zfg/5lIxyK389i86bEBuID5jLdOcF8V9IheBG/UjsoOVDyQVJ
 1oooH36QwXCQ9PQyGXXXgcUg7WaY7jhlzPC27xuCszYm5ispQln7vAXILqkqjb9R0oATmd4t6MK
 vej+89iMN7GMD9rPPhVjlgYgvnez6IlU+HAHXdvSWqEQTHYKTWjC5CSG2fTfhnYvdZkBPCWxMod
 ejjcvav2nTNAqVVP3Lg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac66191 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=z0c7nXvavwv_fPd8bKcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: SUAIKp-04Z6NL1Q7P3STs5nGSULEY2cI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070060

On Tue, Oct 6, 2026 at 10:19=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> > Does this error path miss an IOTLB flush?
>
> Yes. msm_iommu_pagetable_unmap() called iommu_flush_iotlb_all() after
> rollback. __do_map() now calls __do_unmap() directly and loses that
> flush.
>
> An arm64 QEMU/SMMUv3 test:
>
> - mapped one 4 KiB page,
> - hit -EEXIST on the second page, and
> - verified that rollback removed the first PTE.
>
> No stale translation was observed because the device had not accessed
> the mapping. This tested the low-level IOMMU sequence, not the MSM driver
> or Qualcomm hardware.
>
> Restoring iommu_flush_iotlb_all() on this error path preserves the old
> behavior.

I have a fixup, but haven't sent a v2 yet.. current series is still
enough to verify whether there is more work needed on older
pre-arm-smmu hw or not

BR,
-R
