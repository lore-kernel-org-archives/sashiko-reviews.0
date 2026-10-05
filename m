Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127BD4BA1DD
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212423; cv=pass; b=jqVah8E7dh+PDhulmdeFnLVlcYgThMX2wP6MYaJl2OMsowV0u9Ee12XY3SGjwxkl6SJChhJB3JONc8Lj03ZJlz0XzsWwElYx4pDRNUk2iia1mRTTzyll7QrpwbqJGnyIAkOx3zIrmGuGm9AcdGYgQRlSaZuqgm37eLqkrlsb0Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212423; c=relaxed/simple;
	bh=BAUPfc+d/KzUtKtMkOaQA/Y75RlZtjDLnu7c4kxIwOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Smy64Ms3/+HmWg1TRgteqcSa/NkOYEl/gxSXmeQTpAQLZH3co//kmDf9ksvVRPKyRzhE2FH4a/FIqqZcJSPnSLBr0V2UyWmCv78umJ0BKA+vu+09MK0qF/Uyz6HyI/w4tiXNbZDZpOnZOsOwoPQSdlczSyTAnDIM05OqXYvMh7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YE8sU5l7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gcv8EzSJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE8sU5l7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gcv8EzSJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EQFhq762590
	for <sashiko-reviews@lists.linux.dev>; Mon, 5 Oct 2026 15:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=51kUxIfyqGzRB5WXfz8/XC+10ItkLiZvc3aGWbygSrs=; b=YE
	8sU5l7IAF96xl0Nrw13i0ylLsRAFo6DRYA7ZyvdcAZHI2ryrZYG+CYCj/2vd6w5v
	UGiCLiPzpXR/fkTBNpZ7Q4BVKTs0jzrNI6M0p0CQrfVidNFV4r0Ss5qfgtLz3BAs
	tCDXO4F9eTCfKSAdic8nd4Skf3fZbrgahLWVXhtbWO3Z2C/BcKVPhGnT63OcW5AP
	UN8JyBsWIHYY97RC3PGfTlPv1x/x1ryFjHT/jz4r1tgv6jF4eFrxQ3DuuG4D21L4
	/IGSGbL4PZ+/eNNQVkvqN2xbK2fGulKgbAVNVnTRd4AGefp2ldJT+vyiDa6jGzVt
	B9X5cllJxLnhQlxy6qIw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncg4xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 15:00:20 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8242e72d404so3736333a34.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 08:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212420; cv=none;
        d=google.com; s=arc-20260327;
        b=ius1v6tXCo+G+guQujbNlj+IA9THUtBTiDfJ6SZV3Wjcg0NAs1O7DNfChccKzAFBhX
         H+muTGOB9r97hAugR/ig15a9RdraNsTJDyHexzWBeUl/K6mklAlVB42Gobco55RNwNGV
         XfLFudQBXG4upFJwKVzRUH+L49ZC1a6M1EGQvP0uCIhZyqMrrcAaYFiePShUcyir5JKB
         2Wemap9kfrGeXWlh1bFdPysk7U6CReT3amcF7itoeoH82NamnUc1bFlzdVHez1u/HRjk
         C1HQQdxZFCFchhN591E3rbRcnxHe2H4ZfvIUDLm6pZgE4XeL1nve9u5cn74tia0Xss1C
         yUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=51kUxIfyqGzRB5WXfz8/XC+10ItkLiZvc3aGWbygSrs=;
        fh=22FEy3E3oWLfconu7YbfLME6uL+AtQiK4MdxnoUND/E=;
        b=Q2FZyfVtAD8d1V9D4wQRW72O+eDKH/DPHUNFxzdnsRDX/fKhSdpmnbVOf2rBE0RrRr
         3XgJ8+mq+rU0XW2jRy6DhsAvKFvqzWxdXXLsxPTwtRDbbUgDfckMkrZ8N9n5/aSUBNVB
         9JeI1N2i3I+YXR3EEgAH7zEkHm6nnMcivE42LNO2HOubFBsM8W88jH3RV7Cet0tJsdhP
         9cXMANp/bQJNgnm1DafLWBWGa6phCMTmCZkYpaRWEHNcF3/yRQKQQeP+1DXPb6U4Nej3
         Mm2UDOX5lBbVSJajTTva5O/TM9Vupgjv9mMwuzJV7F/Of/NwVSG2uvikkFRqIF4D3meR
         y3Rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791212420; x=1791817220; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51kUxIfyqGzRB5WXfz8/XC+10ItkLiZvc3aGWbygSrs=;
        b=Gcv8EzSJsBtRRjbE3dK7/GfcqWsmrbTMs2dmQBKVCQyRt63Di4mBMHsikSIjuTuHya
         QQA/DUUhCVksDqTKDOBBeikLebx6kuk7pFfoktCD3W6yV+/HmS7vq6i7KM7i/B79hFQF
         kPIzhrg675dflEMEKx8ozZ4d/KGbBCTlxJnxZIUlsiSyC/nvFEKoQI/uul6eDcIoz9um
         0mBC1D4+0BLUJ7VZRnfaJEaAYYInrdbRDFIFlIYdHExuuKFpL0iY5imdr4JCFCcf0Y8n
         ICDeDZLH3pz085hCLEZIZHbjhpLwwIav+ekV6nqVbqOMQQHVEiYWmCNMbm0S3i58bK2q
         Bz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791212420; x=1791817220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51kUxIfyqGzRB5WXfz8/XC+10ItkLiZvc3aGWbygSrs=;
        b=fXRQeLOrH/RXc5QKpxRPP2nxAfYbAuOAe/THkHYyDpHOpgRcWGuLKjVDeIo4NScn38
         A6hVk/2EtBcle9GIyf9yK4EXZwj0gCZ2xeg18qpiQ6mfzera0m/lGo3yHQ3qfR1+Ptja
         9GX7lFllT0xcKdiLwF8EpxRDFESRnpUZvL3x8SjEYrlrA97boYBza57/F18zixTsASoT
         Dw1JLEwTG5KbMUXy0Orolw8llzEZTwMweaRhBnXLyfxG8Y5utYaMeOccpVgz+HKRomuZ
         GhAV4ly2G2R6p72ERmvbG+Bv5Esv0t1B0n+JxoBdQmeADRa0vP/cjaONlTxGRtIS3hJw
         8ekg==
X-Gm-Message-State: AFuF++liqJ5Oum74tJPhBvpGRRh/NMqblAy7rISQKQm/d/I1xftNKYV8
	Qy37Ivr/xpPjKzfUgh7DCzjHrIFgEin9p+OXMjyQWEt6yli1U4KXgvoDezKBkfDs4uSj8miOynR
	eQQfYzuMM6UrTy+S5blbdv5kfDWNJpGGQlS+MEYSmxUMAmefOtyTJ6qyG0YnnOdYVah6kCadIIs
	ArGULPMiXmmOdEJ8Cq0HXxzEFes78GNWevviW5y6Y/vdDq08Mzwbg/fg==
X-Gm-Gg: AYBFou3zLUN7Myb5EI+ZSEfadaZQp+9iSBpPfJPqJsKStiPpqE0qO+rrkWSyTjUo7yG
	3wkdtcKnt99tgv9GZ/WuaUi7geOXdJ/ZbhOM5N7GkMLFuN7GCDmDYK31nSf4ZfzTD9T+2VsXFFK
	K8JU3ie7rjY4VTB/lubGzlXM/0qv22gDqrroPRLZi7X55NxwYd/gE99Xxr
X-Received: by 2002:a05:6820:1897:b0:6d7:a13d:fd8f with SMTP id 006d021491bc7-6df2f9f94damr8297354eaf.9.1791212419816;
        Mon, 05 Oct 2026 08:00:19 -0700 (PDT)
X-Received: by 2002:a05:6820:1897:b0:6d7:a13d:fd8f with SMTP id
 006d021491bc7-6df2f9f94damr8297324eaf.9.1791212419314; Mon, 05 Oct 2026
 08:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260822-msm-fix-export-v1-0-917b3cbedd43@oss.qualcomm.com>
 <20260822-msm-fix-export-v1-2-917b3cbedd43@oss.qualcomm.com> <20260822090757.624751F000E9@smtp.kernel.org>
In-Reply-To: <20260822090757.624751F000E9@smtp.kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 08:00:07 -0700
X-Gm-Features: AclHuK-VYGgmAV2KgLsEUw30s74ElUKdRVK2vDHdrY2Jy3Wcwh4cD4DhCwav8jM
Message-ID: <CACSVV018ggaw_V+7GxGY9ZQrfg8UEfhHfHWiS9NoVe6LJkw2Eg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on handle close
To: sashiko-reviews@lists.linux.dev,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1OCBTYWx0ZWRfXzSRLwhxMlMj+
 IfVyZSTKqwphMvNN/OV9PAocJ9xt8vxRvjs4eFkwL02SuWuZNf02bn3m+/Y7ENV+WFyB2sydEB/
 pBGPTDGW05gtI80xJseAnB8765qUvQU=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac3bb84 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=q_WjrjqfJ9ZDdrt45nIA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: S_MhBy3yGC76vWHsDGPuSMl2H_SBgbsc
X-Proofpoint-ORIG-GUID: S_MhBy3yGC76vWHsDGPuSMl2H_SBgbsc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1OCBTYWx0ZWRfX8JA4iNWFzM2Y
 BGvS/pOU0RlVxc1lc9gYPaAdY3USqEhjPJQSVas/4Sypi3pRlRuOFJ9pRwsc9qv76QVf7AefTPo
 IT8DwEeuYI7JEiGC8+CxHJBN4o9gDZlOpqJixGbFteQwKa4rwmPI2S00M2qx2y3g0kqcsBQbxyp
 DyoYzCBVRo2gAZq19x9V7LXEXnrLnASrulv0zeHNAIkiUZhC5Xo5OajLYgFA1i7+Unp5TCZSWyo
 /1F5JBv5EtuP3raOtyDxDP2eHqcsoYbsNTmYq7U20qHFslkwpglZelMUCgc/DhAfc6X3pcUfUrp
 IuDZ+pCK9a6ju1m6xoxur65MbKaczLUAfOZfXfWppeJFA65FSD6tqVN6I/PlpfMK9P6LGyHfxIE
 cj0qNYfInEEXRnhTpyWKVYZq0MmPNB5BtcgMrmh2d20K861i4Tman+nJi70FQKEPnqTv36Z6fHb
 jRLGs/nHIN/UEt/QANw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050058

On Sat, Aug 22, 2026 at 2:08=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Sleeping in atomic context
> - [High] Deferred teardown TOCTOU race via flink name re-opening causing =
IOVA Use-After-Free
> --
>
> --- Patch [2]: [PATCH 2/2] drm/msm: don't tear down shared VM mappings on=
 handle close ---
> commit c4a550033efcf938dc9587175385266d18df3979
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> drm/msm: don't tear down shared VM mappings on handle close
>
> This patch defers the teardown of shared GPU VM mappings until the vma_re=
f
> count drops to zero. This aims to prevent pulling the buffer out from und=
er
> other files that still have it open when sharing a global VM address spac=
e
> on targets without per-process pgtables.
>
> Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
>
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 8b979d84bb958..f17ecd97b72a3 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> [ ... ]
> > @@ -109,6 +114,12 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
> >       if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
> >               return;
> >
> > +     if (priv->gpu && priv->gpu->vm_shared) {
> > +             dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP,=
 false,
> > +                                   MAX_SCHEDULE_TIMEOUT);
> > +             put_iova_spaces(obj, priv->gpu->vm, true, "vma_put");
> > +     }
> > +
>
> [Severity: High]
> This is a pre-existing issue, but can this lockless vma_ref check lead to=
 an
> IOVA use-after-free if a GEM handle is concurrently closed and re-opened =
via
> flink?
>
> If Thread A closes the last handle, atomic_dec_return() drops vma_ref to =
0
> and it proceeds to unmap the buffer. However, the flink name remains vali=
d
> until drm_gem_object_handle_put_unlocked() runs. If Thread B calls
> DRM_IOCTL_GEM_OPEN concurrently, msm_gem_open() can increment vma_ref bac=
k to
> 1 and submit a job using the IOVA. Thread A then acquires locks in
> put_iova_spaces() and unconditionally unmaps the buffer via
> put_iova_spaces_locked() without re-verifying vma_ref:

This is already invalid, the flink name doesn't hold a ref to the obj.
The exporter must hold the obj live (by not closing the handle) of an
flink exported BO.

>
> drivers/gpu/drm/msm/msm_gem.c:put_iova_spaces_locked() {
>     ...
>     drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
>         msm_gem_vma_unmap(vma, reason);
>         if (close)
>             msm_gem_vma_close(vma);
>     }
> }
>
> Will this destroy Thread B's mapping while its job is running, freeing th=
e
> IOVA for immediate reuse?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does adding these blocking
> calls cause a scheduling while atomic panic when tearing down a writeback
> connector?
>
> The drm core function drm_writeback_connector_cleanup() holds a spinlock =
with
> IRQs disabled when tearing down pending jobs:
>
> drivers/gpu/drm/drm_writeback.c:drm_writeback_connector_cleanup() {
>     spin_lock_irqsave(&wb_connector->job_lock, flags);
>     list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry=
) {
>         list_del(&pos->list_entry);
>         drm_writeback_cleanup_job(pos);
>     }
> }

Hmm, someone should look at this.. maybe we could move to an on-stack
list under a lock, and then do cleanup outside of the lock?

BR,
-R

>
> This calls into msm_gem_vma_put() through the teardown path
> (dpu_wb_conn_cleanup_job -> dpu_encoder_cleanup_wb_job ->
> dpu_encoder_phys_wb_cleanup_wb_job -> msm_framebuffer_cleanup ->
> msm_gem_vma_put).
>
> Since dma_resv_wait_timeout() can wait indefinitely and put_iova_spaces()
> acquires ww_mutexes via drm_exec, could this result in sleeping while hol=
ding
> a spinlock with IRQs disabled?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-msm-fix-=
export-v1-0-917b3cbedd43@oss.qualcomm.com?part=3D2
