Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076728;
	b=1wuJ5Da3iGclxb6hCv2kuHlV9xMm/GSrIBdLTxZQAlGQJXHuYU2isCuhAVjIIHCNJxrT
	 LVB6ByMhbTFDGDVtE8PsKWSgXbrGd92j3cLhRarl0l+W+fwAlCvp5f1z2yRje7Fbvlr1F
	 rYGlAm03sQX5fqjOd8taZplFqPdXN11t6FozOwvWihLrCXGzSQyt0geXPUg6469/eNaWH
	 nzqGiWj9datXLsF615zQ0xzYN+D4oWdjEoWWg5XTUMRjBsVj3TbOdjln05m+POQiJfhpb
	 s6W5+yRj7rAlGaDGTexrztE5B0alqN91G9wdEsK/77Oj0D1LtOQgs8pUl8CT8Gel2nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oEE/mqi6JoKDrenw6SXjNhEhAciqo4FTpGNcngltvto=;
	b=Y7pji4iARGKJtgKRBuzfgSXmz5ttNM2PQHfCbb2IEPI2384/7GrfM2Uo33G12eV4TBbK
	 s16Uh0t6aVvqS5p10+SRFI5RTJaJzJKbjXnZpFfbe/N9mUmtgQ6I4Ft+0qAWbmyuua6ms
	 GgvzeoDNXEc17D/aqiyVK3Z4q+YGgRENb2rUjqT+WDun/NiHoN7dExwim/t6ITZyl0NKH
	 iUyXkjrt7v3L/+kKwYlI7BT5q7OEsjjyX/4APM/2ee2NdiTvlV9LlJcVF8EzS7ZaWHCdj
	 rWr+4hNcCumcKcIuT7IqPNQ6cHHUgbN1++8zarXYQOi4FWb5h/hIspC+8WdO+JN1PNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Om8C4zxm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2VXGhdu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8A606A334
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 08:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE8A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Om8C4zxm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2VXGhdu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vPbr053035
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 08:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEE/mqi6JoKDrenw6SXjNhEhAciqo4FTpGNcngltvto=; b=Om8C4zxm4DUUiKh6
	l9XE9R71z/YM58bUd3iSfN/Yd97bBeT6T7F/sqedWJP7xY+XX9TsiQA8vp27Z73G
	18/LDP7efi7tkIujuKG1LdTzlVKrT5bSookVsex29cc0cSZHRwjIgUhJePEI3rWD
	wy1AJYu+tb2RwsPLGKj4yGSxJa0bCtvlr2EAPcEQ0X4mVzwLuL5uBF3gAYATrlf5
	o7w6DkaVQkNA9Wz6ZXz2t1l7p1bnJGNkapAE/dH33DMqmkzVkHIhJuL2LdUIAFr5
	pg36xPYHxvqy9QvXRb+HVTv8qJz+UtJrb84HVwgxxN5qoLIIB6laM25P31GoReVz
	iHWAsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3bbgjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 08:25:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-946038e22f5so37510585a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 00:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076726; x=1795681526; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEE/mqi6JoKDrenw6SXjNhEhAciqo4FTpGNcngltvto=;
        b=O2VXGhduOGAwOlRiHnL88XwbV0RQeUoyfE+nj/NeAoGlTn3Koz4IrosKo2rRv/BQCU
         xkQ5QkLyZzgoFniUDGXYk59hniGdO2yA2IphyhQk8w3scoC3MOLue4l8k23Fzcuytks8
         j3bAdwzufu9gJ2F2Vczy/CDVvKmiu7cvqjDNuKynsodByr98925hhj+OiCaV6lvONDp2
         dNCYPhxRiaqagU0nP76CoDQZXOu1n7npZBBtzyXlq7OTgxuL0LP3qswnIceZ50Butsyu
         v3tHbKq1GBeyybTIQp3rADXNH24ntKiLfAH1mtZhic0NhOzx546DIpobSq9e3FELRITr
         WgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076726; x=1795681526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oEE/mqi6JoKDrenw6SXjNhEhAciqo4FTpGNcngltvto=;
        b=lE0JqyXI3/6rrzr7dSivzmriO8dgtahpSpf8/21r7W8CfXMUDV8gsTV6XUug5GkNS3
         +eU2Rvz2XLElWpy2MstRxyHtcOOOKG9Lc2UDDpRhRFrAt7R5rfl8KI6RZ9ZRHdHecImH
         OGhw8jivKr7VCWAcQ6nO3eg3xATUYCCe27HWkPwBXYsQdH/7zKb25SLq2fl3QEZ25C7c
         BlLqd0NunUoB2R/5U0YHU9n1zP3s0RzwJRo2Vce4hrV86KyKCCzp5KpW6AoUwC7BjHS9
         8n9ERIpp+dhkWYcLTepcicTuUpRDgqhtdh+scNpkktXRpdxgT8EHLZqBWskfGgFMQnt2
         tk1w==
X-Gm-Message-State: APuU4Z9Prj4VuA7YGjUIMR4P4u+kK4C8BhaCB2HxSDQDZZasAzPA8pCh
	36IVa/FViPL+aNm0wjcKOhIDwT/HePntTbXrEWl7th/PSwCECpeEz+h5r5y2KbbAfypHGxFaRmY
	JhtCa8H2CAyFtJJ0bhiqZNmvU+mJ0TUUe2zk1n6asJkXibJcsNHBwHXIY2FfWr65P8swCV2qK6A
	Hk2AeYEw==
X-Gm-Gg: AYBFou3281j+9RywdjAvmdgRyxJ65aYFX0Lytfl7YmFMeU2uNyQvxN5DR7JCiZ3+zLZ
	4YRwI+yLGw8j1Xbk77zLUMJ4XIO/DpTStJ3vVDJUM8oN+MU4A4hlAHyApb9hLNY95nCNurFVRRk
	a8PYC1t6vd2OUfcqYiQoqxTZStaJ+1FOhGy9IpZWix/adeRt/HovBPRQIhrA5OXonEfmyoD83zl
	5/JEisYi26kQbbwbX3iRFRq+btXCKCavGjfK7yjykz/way2JQr8luuTbzjzDoch5wjm/XVZSb00
	38S/HQwBYPtcaKHlE1W0cIv0GWhi9OTT8DXKwHKxt/dk0ncWt9SEGR7l1feb+oggWh/Am7qXdhL
	f7DOBr8cxlstUVj0EaP3A4JWE4KujIQCuEkMZSmniHpSRI0EDGjZWOn0xLV/GN4yggGF32dWNW3
	yIGqydxlMw9/8JrPSRZ4FiJ8RNNH6OOHfk5Vn2tn/JCN4m/73Fmy7Td8uT+LuHsg==
X-Received: by 2002:a05:620a:270d:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-949997abec2mr858254485a.54.1795076725719;
        Thu, 19 Nov 2026 00:25:25 -0800 (PST)
X-Received: by 2002:a05:620a:270d:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-949997abec2mr858253085a.54.1795076725213;
        Thu, 19 Nov 2026 00:25:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa75f046sm1234070e87.28.2026.11.19.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:23 -0800 (PST)
Date: Thu, 19 Nov 2026 10:25:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org,
        media-ci@linuxtv.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on
 handle close
Message-ID: <pk5k4tcrn6p2lrghqh2j3uprwaxuy3ugaewuupqg4ecky5xvse@3bwy5d5rozvb>
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
 <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com>
 <20260822090757.624751F000E9@smtp.kernel.org>
 <CACSVV018ggaw_V+7GxGY9ZQrfg8UEfhHfHWiS9NoVe6LJkw2Eg@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV018ggaw_V+7GxGY9ZQrfg8UEfhHfHWiS9NoVe6LJkw2Eg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 4X-khUHIDjiLPiO-c_TPsGMSv9qlXHfm
X-Proofpoint-GUID: 4X-khUHIDjiLPiO-c_TPsGMSv9qlXHfm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX3lFaDQN8z0YS
 qqDkAIHh7syrzzvWLGYjD+O6wMnZ2sRbjMm84V+5fAHiXidCjgtXJBSLdWwr9JqTBFDSXfjGxoG
 FC2IwdSPI3EpGyF0gAR72oMRUW8Mm8g=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afeb276 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1fJnDc9Itneyp4R58M0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXwiycOgOc7DMd
 zGIt7KVlSSwM0rgbEzZ7GdKyMJe/k4h6YyJy3OCzh6bgCugs9dyOkN1q5iDvS0OmXgZRRJBrDIq
 lLCbxLYvtvC3wMnZ9hQZVyFRtXrT53MRwgGoRlYPasSQ5UMSYgE5PY70npDxwsYlZlmRaeeDIQK
 /cbbEcUq9rr6jvrE1H23HC8AMF7eVV5ShXilpYNvM2BjSTHVuU+klPrX2dROzvltqA3Xwjp45Jv
 3hgIsrGC8iKFhzB1s7AVXMumJVDCTZeQ52jLYsxyj0kgbdi//lDKTki72MHtjG82rdVa+mRrSPe
 TOq8pmKepVeASJYPUxLuCWcjKSgBE4irPEl2ioCw1AZStDrNBf+vK5Wbjn9pR6Dsqqh4grGWOSC
 Ai9lMAEGLfvr57WllxjCUIquthHpoDNKiZ1xl2tKFfc8sGdEDksN5MymSkwQxKX29IFYXNV/ASk
 40mfPoqMW3PhVxWc2Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

On Mon, Oct 05, 2026 at 08:00:07AM -0700, Rob Clark wrote:
> On Sat, Aug 22, 2026 at 2:08 AM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Sleeping in atomic context
> > - [High] Deferred teardown TOCTOU race via flink name re-opening causing IOVA Use-After-Free
> > --
> >
> >
> > drivers/gpu/drm/msm/msm_gem.c:put_iova_spaces_locked() {
> >     ...
> >     drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
> >         msm_gem_vma_unmap(vma, reason);
> >         if (close)
> >             msm_gem_vma_close(vma);
> >     }
> > }
> >
> > Will this destroy Thread B's mapping while its job is running, freeing the
> > IOVA for immediate reuse?
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does adding these blocking
> > calls cause a scheduling while atomic panic when tearing down a writeback
> > connector?
> >
> > The drm core function drm_writeback_connector_cleanup() holds a spinlock with
> > IRQs disabled when tearing down pending jobs:
> >
> > drivers/gpu/drm/drm_writeback.c:drm_writeback_connector_cleanup() {
> >     spin_lock_irqsave(&wb_connector->job_lock, flags);
> >     list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
> >         list_del(&pos->list_entry);
> >         drm_writeback_cleanup_job(pos);
> >     }
> > }
> 
> Hmm, someone should look at this.. maybe we could move to an on-stack
> list under a lock, and then do cleanup outside of the lock?

FWIW, the fix is implemented at [1]. Would it be reasonable to pick it
together with this series?

[1] https://patch.msgid.link/20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com


-- 
With best wishes
Dmitry
