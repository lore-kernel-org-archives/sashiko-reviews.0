Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793736951;
	b=LGpqtR9qNAcCXJ/u6FWYfXBVyCbD2tZUpttIuFiRzok/OWgQH4YGsqDwviMqqeGMI67+
	 N5UPy6q5+NvVbp56Nsm71w4B/55htlLOuI3CtP2SEEzdZKKtkFcqo9LLVPDGSDFw+n3xY
	 v0C3C361s0At82ImME7JTw8tG1O6wT9ed1d9oAk3v7ibqjBL9mmfnImk6shxlpKdWABXD
	 IQ+GSRXFP9sbY9vwxb6pV8KSS1v6DTMugpGwENhGnHD+p2vdgKJ+NdMBQTJd2ZoU+umEf
	 Y1KjUJIeSQmY6RG4JguBo78s0dhpHd/SY6sYYxogH4B814zyrWhe5jYRBz+xV0FBqlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fQWmdcDL6Cf0p4F02BPbXYU/2SPFqbcTZjVM7RMBUmw=;
	b=QvJv2c9gie5k6A8zZZMK8EUH3tmlqyLhgaq/V4LBdwjpHpXbFJiYxlkypJnD7XAhV4tL
	 wsi2E7/G0NSX+yH4Y5in/KKHDZ1aXjyBkrnxM6Aslc1W+FDxIDHl3uGhXquGf8Kxn5fCL
	 jAWhi388N2WY7FANoPUKH2PIN1bHGSzeqIqg7IiwnrNxgzoBeuSkG6Ydx1F+qEk/r6lGk
	 Fb1+1ePu6ibnr8y8jWuikEnqGGghvM+rNks50NfWsoyNJDYUB/mey4e0MF2OPRj3KH4/H
	 IYMjo5JqTzpPLEqITz4veXCq6DpeIqV8aJAHpD2ANidOnFVp65DRrmZLbPM7MrFeLFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZaPH5Ct9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YX7Jct6D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371A606A32F
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 20:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B371A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZaPH5Ct9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YX7Jct6D
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ56Q056623
	for <sashiko-reviews@lists.linux.dev>; Tue, 3 Nov 2026 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=fQWmdcDL6Cf0p4F02BPbXYU/2SPFqbcTZjVM7RMBUmw=; b=Za
	PH5Ct9rMcuWBkD+H2gWQlyz38rtjVVrYO4AHgV2zsbg38FreAcDRdEt7zpNH1chS
	YfP0IcFcZ0NiqXeFdbF1zeonKVgDZbWOr7ibIfhIsZCdkWNX6Rq04rdK3pkycJPa
	rWCf+m/tLl0gppfje56ijvt4AdPS12VrX0v9HW6Cjmrn0OYIQGy9DRdMDSGro04E
	MGotj2mK9sy+3qzgDzMg57ItKaGM4bWNifuYN0IVp+j0imiGV30Edx7yux+ugVQ7
	w/S6JVcBXOxYX4ucvergODA/1l+xbDRhCQi/PJWkoZbvPYfptyf1+bL8+BLBxgjJ
	9WFXGTmpNBSPwXHOx2Tw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp8wv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 20:15:49 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4943ed99826so39479fac.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 12:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793736948; cv=none;
        d=google.com; s=arc-20260327;
        b=MnAr94fBNr91iKEsALN9a27lH7743SobuToA6sCUsmv/wHTHEAO8vhHcYPfW1+nGg2
         W64WDBqAZtH4PZz2rSKbnFO1ChU5RGIu1FVzfp9LUrbGkngnY2jPorawXME0ORXux4yh
         LKigUOW7ypQbv6jzJw2D6VrdXRzdrgK+3K0UyuFwx4GhypYttEXM6Yg4UU87/PB5Da6O
         VmUOfXkVQMjpwyggW1PUtpdsBsOkfWO7pMENIIWNXYjxLTJpUlDQyngdTVpdYKqM4V2g
         jwC4gct5TNq951i6hQb8GBjI6/aL5JOWAIVoUh5WBo3iYH8SoKkUBDOy7AttGs1b1mzN
         VgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=fQWmdcDL6Cf0p4F02BPbXYU/2SPFqbcTZjVM7RMBUmw=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=By7mypf3wDRBvXS9CwYVjGvkSFDd7XyHw9+qDN9TdQa05/wXhXAHbsJpLinggDQsp5
         kxZFw2vr9cqErqsgZcUOyhpLp0HUFLNeVOZ1m4gXZ1AW1Py2dATEPAE+f0HUGjO9H0A7
         QvABcdeAvAvsvmYuW0j95hgwRjY8WM1CrlcYXPvwi5ys2LjezTTspuynOfrJfLaQkvTm
         JOK41ClnaNSwk7mpFrsFIeFff4S8iq+NX833JRYuUD31iZ7ZRR5s/TavwszMP+94fSN2
         f6v3JSn3D19aa/1ESPFkHWmjCAVjWzlDY9i6uw4CE/uX5lshlvv+5K5gYOvbd8PgDcIf
         3SjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736948; x=1794341748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fQWmdcDL6Cf0p4F02BPbXYU/2SPFqbcTZjVM7RMBUmw=;
        b=YX7Jct6D5SIeunLLAHUs+SkfL4mRtHF+a3Gnt4ssCQQlZtEgwI9zHzyJoNRydVrpwC
         4aHFJZbA/OPZO7FmpQgab1dMUj9t/QDdN1KOlP/URjXPLPoXjytr5opqqZlguMivnI34
         99KQHdNG1UTg7ONk07ZdZUU7pix4ezA1G8p9nJRT0RCSbkBYZ/+Jx7jvvGqtDjsuFJZT
         2OCqsDl7mBO+zDBAtSVkSSZNEZPtSpIupdaCYIoRCmZ51rV+IwIuuWetYXEk0JQkjBA+
         iSG8nkhQtbk65c6RlFfdl0SagMirFY6E7OjFpQnURbvKp/u1hLJpKgu6dJQJzWajb+Sm
         0iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736948; x=1794341748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQWmdcDL6Cf0p4F02BPbXYU/2SPFqbcTZjVM7RMBUmw=;
        b=Tgw67Xi4qKelVdQiIYzHVeP7CPhPVrdlLol7MtZZ7XyMPfw3pWR26pwPAnK9grIBXa
         22xgntEDwkfk7gebJvp+4p41MLMCPB1rOftondYNI0g/OI9RHMPO2ma1niol2NBbMURy
         yxNYlldxwiZOb/ut+2IL9YWLTrmtpOJd686WZ1pgMLlg5AYRZ+bcJGRB2FUEA8MPezYN
         b919j9adxD/ibMlEaU3t//BMxioEIC45eSQ+YsYDeruvFZNPD3ZuYMXqn02cAyXleyGC
         aUldC9Fd0PWgZ9ngmoWyzt2GH7bpTWW00Hibo0nvx+YgbT5XPvtEfLJ7BsC2vwMyLo0U
         PoNg==
X-Gm-Message-State: APuU4Z8sYs23EWkK7x76YiocxU7mJJ4/UiZUWgEi1xFBPhV7UgDeeAta
	J8Ua9yvHJ19Yc6hAriM1TBfkjJzOOXfkBtdfJdeNrBQjm6dMY32JodYebnV3RQtbnOPbUuHr2Ej
	87B1rw+snwklzOLJIRhwvSfNjDSdZ4aBMq2K/2bHBnfZ67XUCCUNoMW6Xx/JBiqXrV1+VwlOA/O
	Mls1nX5KXudxNficT6SLkdhq3cHyZKrJDQlUlL2QAoXTMKCsLYcr7ryA==
X-Gm-Gg: AYBFou1pcWL5GJ7RNYP09vAkLyGGIUpb99ksj1IUHbD6KAGxqUW2K45wZ2I5TITjlAc
	sR2EbYh+PfEUXTbvSwOIOtTKoikt4KR+QMzG57s0/IVlJ4YdUyDEUKxVHzeqQiNNbmDBAPkYkbq
	/tCma7ktTZkzBi4WrAg5Yx9wxU9hyVn//kPYfg3eGwUiBZlEjI8kLBqMwCaOKF6QINc9bptVm3L
	QFCbx7oHqILoG126wNQ2w==
X-Received: by 2002:a05:6871:a86d:b0:4a2:c175:d339 with SMTP id 586e51a60fabf-4a90775b604mr8932181fac.39.1793736948079;
        Tue, 03 Nov 2026 12:15:48 -0800 (PST)
X-Received: by 2002:a05:6871:a86d:b0:4a2:c175:d339 with SMTP id
 586e51a60fabf-4a90775b604mr8932146fac.39.1793736947335; Tue, 03 Nov 2026
 12:15:47 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
 <20261102220405.30730-12-robin.clark@oss.qualcomm.com> <sashiko-outbox-194286@kernel.org>
In-Reply-To: <sashiko-outbox-194286@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:15:36 -0800
X-Gm-Features: AclHuK9jHJl9ylHYf3aDmzOLPgH6YYGiep-CC-qpTd6jOhNr1FgWOibe_0bIeEE
Message-ID: <CACSVV01czyX=pVrX2Pq3V4W1rWV_sDNomwGLnBDxrbCqwYpP2w@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] drm/msm/a8xx: devcoredump state capture support
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX2IRlMmD6ivuM
 YEMM2kEpZnxdCC+eGHiV1DfO2fHpa4cGaxb95F6H+tf8H0bUMd35VXeNVQTHKs3edQhSL//97aH
 OFdBEusmWH7Bpnec0rLXLX+vH9Dgd4aFwjHy6d3NKd7zwCdZJrkM88DH64CDbpusq4MUzPJID0J
 Y78hJlYC0Drk4qWCTqgyMhW0oIsIATR0sj7zIgTQfYQ16BR9tpMSRHIaFpc5NR3kol+cBTPd22M
 1CiCVG7g3PbNQKl4tjWxGSet/c/7hyCUmskhxuOOVfeutuoaIBq/XFNCi71ew/dca0nsbPaIzx1
 ZWjs1AyKYySMy2SPajGPrNz+ElFn0OeasWrQBv9hOKPwE/pZPHjsJ3YNc7rY5uo9rUygZmxkVOw
 oT+e+JqgGNd0fb2bi3ePXJ0Ri+mVorXtRpKuqu18L00uoA/5iZPWX6aRFVIhAwizzScrR942ksa
 y2li/vCrvxU5RWh2tJQ==
X-Proofpoint-GUID: IA4Mp366kqYTzsBr-oqPV4qU9kSF7Fsj
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea40f5 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8
 a=X5UkEppQgMmih3U4cmcA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX2kiqQjx0RLsA
 aI8B8b6mnjbaLFQim/+w8Cve7iETe0kgSXefSgB8/iSUJRXNhNoaQnViRYbJFiu/g/GHzpDEPDk
 NfV/Mwr/C0iQJR4jwFZ8RQ42g0GKI9U=
X-Proofpoint-ORIG-GUID: IA4Mp366kqYTzsBr-oqPV4qU9kSF7Fsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

On Mon, Nov 2, 2026 at 2:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] drm/msm/a8xx: wrong GX power check helper in a8xx_gpu_state_get(=
)
> - [High] drm/msm/a8xx: invalid slice 0 access in gen8_snapshot_mempool()
> - [High] drm/msm/a8xx: unguarded preempt_bo loop in a8xx_gpu_state_get() =
causes UAF
> - [Medium] drm/msm/a8xx: dirty CP_APERTURE_CNTL_HOST state in a8xx_gpu_st=
ate_get()
> --
>
> commit c7a029a7073f0aadd364139ec43ceeb070ef9dae
> Author: Rob Clark <robin.clark@oss.qualcomm.com>
>
> drm/msm/a8xx: devcoredump state capture support
>
> This commit adds devcoredump GPU state capture support for Adreno A8xx GP=
Us,
> including register lists, indexed registers, mempool, MVC clusters, shade=
r
> blocks, debugbus, and GMU state.
>
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a8xx_gpu_state.c
> > new file mode 100644
> > index 0000000000000..b75de2370e2e3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c
>
> [ ... ]
>
> > +static void gen8_legacy_snapshot_registers(struct msm_gpu *gpu,
> > +                                        struct adreno_gpu_state *state=
,
> > +                                        const struct gen8_reg_list *re=
gs,
> > +                                        u32 slice_id)
> > +{
> > +     int count;
> > +
> > +     /* Figure out how many registers we are going to dump */
> > +     count =3D adreno_snapshot_regs_count(regs->regs);
> > +
> > +     snapshot_sect (state, MVC_V3, 4 * count, {
> > +             .ctxt_id =3D 0,
> > +             .cluster_id =3D CLUSTER_NONE,
> > +             .pipe_id =3D PIPE_NONE,
> > +             .location_id =3D UINT_MAX,
> > +             .sp_id =3D UINT_MAX,
> > +             .usptp_id =3D UINT_MAX,
> > +             .slice_id =3D HEADER_SLICE_ID(regs->slice_region, slice_i=
d),
> > +     }) {
> > +             unsigned long flags;
> > +
> > +             if (regs->sel)
> > +                     gpu_write(gpu, regs->sel->host_reg, regs->sel->va=
l);
> > +
> > +             if (regs->slice_region) {
> > +                     u32 val =3D GEN8_CP_APERTURE_REG_VAL(slice_id, 0,=
 0, 0);
> > +                     a8xx_aperture_acquire_raw(gpu, val, &flags);
> > +             }
> > +
> > +             /* Make sure the previous writes are posted before readin=
g */
> > +             mb();
> > +
> > +             for (const u32 *ptr =3D regs->regs; ptr[0] !=3D UINT_MAX;=
 ptr +=3D 2) {
> > +                     snapshot_mvc_regs_v3_subheader(&sect, ptr);
> > +
> > +                     for (int k =3D ptr[0]; k <=3D ptr[1]; k++) {
> > +                             snapshot_sect_u32(&sect, reg_read(gpu, k)=
);
> > +                     }
> > +             }
> > +
> > +             if (regs->slice_region)
> > +                     a8xx_aperture_release(gpu, flags);
> > +     }
> > +}
>
> [Severity: Medium]
> As reported by Sashiko on v4 [1], can gen8_legacy_snapshot_registers() le=
ave
> REG_A8XX_CP_APERTURE_CNTL_HOST and a6xx_gpu->cached_aperture programmed t=
o a
> previous slice when reading subsequent UNSLICE register blocks?
>
> In drivers/gpu/drm/msm/adreno/a8xx_gpu.c, a8xx_aperture_acquire_raw() wri=
tes
> to REG_A8XX_CP_APERTURE_CNTL_HOST and updates a6xx_gpu->cached_aperture,
> whereas a8xx_aperture_release() only drops a6xx_gpu->aperture_lock:
>
> drivers/gpu/drm/msm/adreno/a8xx_gpu.c:a8xx_aperture_release() {
>         spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
> }
>
> Because gen8_legacy_snapshot_registers() only calls
> a8xx_aperture_acquire_raw() when regs->slice_region is SLICE and does not
> clear the aperture afterward, when b->pre_crashdumper_regs or b->reg_list=
 has
> SLICE entries followed by UNSLICE entries, the UNSLICE entries are read w=
hile
> REG_A8XX_CP_APERTURE_CNTL_HOST still has A8XX_CP_APERTURE_CNTL_HOST_USESL=
ICEID
> and the previous slice_id set.
>
> In addition, regs->sel->host_reg is written before a8xx_aperture_acquire_=
raw()
> selects the target slice and outside aperture_lock, and a8xx_gpu_state_ge=
t()
> exits via the out label without calling a8xx_aperture_clear(gpu) to reset
> REG_A8XX_CP_APERTURE_CNTL_HOST and a6xx_gpu->cached_aperture after
> gen8_snapshot_mvc_regs(), gen8_snapshot_cp_indexed_regs(), and
> gen8_legacy_snapshot_registers() run.
>
> Should gen8_legacy_snapshot_registers() program the aperture for both SLI=
CE
> and UNSLICE regions (and write regs->sel->host_reg after acquiring the
> aperture), and should a8xx_gpu_state_get() call a8xx_aperture_clear(gpu) =
at
> the out label?

This is fine, reading UNSLICE regs does not depend on the aperture.
And USESLICEID only matters for writes, it controls whether the write
is broadcast to all slices or not.

This also matches kgsl.

> [ ... ]
>
> > +static bool gen8_snapshot_mempool(struct msm_gpu *gpu,
> > +                               struct adreno_gpu_state *state,
> > +                               struct adreno_crashdumper *dumper)
> > +{
> > +     const struct gen8_snapshot_block_list *b =3D block_list(gpu);
> > +     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(to_adreno_gpu(gpu));
> > +     u32 slice_mask =3D a6xx_gpu->slice_mask;
> > +     u32 first_slice =3D a8xx_get_first_slice(a6xx_gpu);
> > +     bool ret =3D true;
> > +
> > +     for (int i =3D 0; i < b->mempool_index_registers_len && ret; i++)=
 {
> > +             const struct gen8_cp_indexed_reg *cp_indexed_reg =3D
> > +                     &b->mempool_index_registers[i];
> > +             unsigned long flags;
> > +             u32 j;
> > +
> > +             FOR_EACH_SLICE (j, cp_indexed_reg->slice_region, slice_ma=
sk) {
> > +                     u32 pipe_id =3D cp_indexed_reg->pipe_id;
> > +
> > +                     /* Set CP_CHICKEN_DBG[StabilizeMVC] to stabilize =
it while dumping */
> > +                     a8xx_aperture_acquire_raw(gpu,
> > +                             GEN8_CP_APERTURE_REG_VAL_NS(first_slice, =
pipe_id, 0, 0),
> > +                             &flags);
> > +                     gpu_rmw(gpu, REG_A8XX_CP_CHICKEN_DBG_PIPE, BIT(2)=
, BIT(2));
> > +                     a8xx_aperture_release(gpu, flags);
> > +
> > +                     a8xx_aperture_acquire_raw(gpu,
> > +                             GEN8_CP_APERTURE_REG_VAL(j, pipe_id, 0, 0=
),
> > +                             &flags);
> > +                     gpu_rmw(gpu, REG_A8XX_CP_SLICE_CHICKEN_DBG_PIPE, =
BIT(2), BIT(2));
> > +                     a8xx_aperture_release(gpu, flags);
> > +
> > +                     ret =3D gen8_snapshot_indexed_registers(gpu, stat=
e, dumper,
> > +                             cp_indexed_reg->addr,
> > +                             cp_indexed_reg->data, 0,
> > +                             cp_indexed_reg->size,
> > +                             cp_indexed_reg->pipe_id,
> > +                             HEADER_SLICE_ID(cp_indexed_reg->slice_reg=
ion, j));
> > +
> > +                     /* Reset CP_CHICKEN_DBG[StabilizeMVC] once we are=
 done */
> > +                     a8xx_aperture_acquire_raw(gpu,
> > +                             GEN8_CP_APERTURE_REG_VAL_NS(first_slice, =
pipe_id, 0, 0),
> > +                             &flags);
> > +                     gpu_rmw(gpu, REG_A8XX_CP_CHICKEN_DBG_PIPE, BIT(2)=
, 0);
> > +                     a8xx_aperture_release(gpu, flags);
> > +
> > +                     a8xx_aperture_acquire_raw(gpu,
> > +                             GEN8_CP_APERTURE_REG_VAL(j, pipe_id, 0, 0=
),
> > +                             &flags);
> > +                     gpu_rmw(gpu, REG_A8XX_CP_SLICE_CHICKEN_DBG_PIPE, =
BIT(2), 0);
> > +                     a8xx_aperture_release(gpu, flags);
> > +
> > +                     if (!ret)
> > +                             break;
> > +             }
> > +     }
>
> [Severity: High]
> As reported by Sashiko on v4 [2], does gen8_snapshot_mempool() access sli=
ce 0
> even when cp_indexed_reg->slice_region is UNSLICE and slice 0 is fused of=
f in
> slice_mask?
>
> For UNSLICE entries in b->mempool_index_registers, FIRST_SLICE(UNSLICE,
> slice_mask) sets j to 0 regardless of slice_mask:
>
> #define FIRST_SLICE(_region, _slice_mask) \
>         ((_region =3D=3D UNSLICE) ? 0 : NEXT_SLICE(0, _region, _slice_mas=
k))
>
> Inside FOR_EACH_SLICE, gen8_snapshot_mempool() uses first_slice when
> accessing REG_A8XX_CP_CHICKEN_DBG_PIPE, but then unconditionally programs
> GEN8_CP_APERTURE_REG_VAL(j, pipe_id, 0, 0) and RMWs the per-slice registe=
r
> REG_A8XX_CP_SLICE_CHICKEN_DBG_PIPE on slice j =3D 0 before and after
> gen8_snapshot_indexed_registers().
>
> On A8xx GPUs with partial slice configurations where slice 0 is disabled =
in
> a6xx_gpu->slice_mask, won't touching REG_A8XX_CP_SLICE_CHICKEN_DBG_PIPE o=
n
> slice 0 during UNSLICE mempool dumps access a fused-off slice and cause a=
n
> AHB/NoC bus error?

This is a specific sequence given by the hw team.  But AFAIU the slice
configured in the aperture shouldn't matter for non-slice reg.

> [ ... ]
>
> > +struct msm_gpu_state *a8xx_gpu_state_get(struct msm_gpu *gpu)
> > +{
>
> [ ... ]
>
> > +     /* If GX isn't on the rest of the data isn't going to be accessib=
le */
> > +     if (!a6xx_gmu_gx_is_on(adreno_gpu))
> > +             return &state->base;
>
> [Severity: High]
> As reported by Sashiko on v4 [3], should a8xx_gpu_state_get() call
> a8xx_gmu_gx_is_on(adreno_gpu) (or adreno_gpu->funcs->gx_is_on(adreno_gpu)=
)
> here instead of a6xx_gmu_gx_is_on(adreno_gpu)?
>
> In drivers/gpu/drm/msm/adreno/a6xx_gmu.c, a6xx_gmu_gx_is_on() reads
> REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS and checks A6xx bit definitions when
> adreno_is_a7xx() is false:
>
> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:a6xx_gmu_gx_is_on() {
>         ...
>         val =3D gmu_read(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS);
>
>         if (adreno_is_a7xx(adreno_gpu))
>                 return !(val &
>                         (A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER=
_OFF |
>                         A7XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
>
>         return !(val &
>                 (A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
>                 A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
> }
>
> On A8xx hardware, GX power and clock status is checked via
> a8xx_gmu_gx_is_on(), which reads REG_A8XX_CX_MISC_GFX_PWR_CLK_STATUS on
> A850-family GPUs (where GMU MX may be off) or REG_A8XX_GMU_PWR_CLK_STATUS=
 on
> other A8xx GPUs. Calling a6xx_gmu_gx_is_on() on A8xx reads the wrong regi=
ster
> and bitmask, which can touch unpowered GMU MMIO on A850-family GPUs or fa=
lsely
> report GX as powered on and proceed with unclocked GX register reads.
>
> [ ... ]
>
> > +     /*
> > +      * Capture preempt records after cp_clusters, to make this easier
> > +      * to decode (ie. so we already know CP_CONTEXT_SWITCH_SMMU_INFO =
and
> > +      * CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR) when crashdec =
sees
> > +      * the logged GPU objs)
> > +      */
> > +     for (unsigned i =3D 0; i < gpu->nr_rings; i++) {
> > +             a8xx_snapshot_gpu_bo(state, a6xx_gpu->preempt_bo[i],
> > +                                  a6xx_gpu->preempt_iova[i]);
> > +             a8xx_snapshot_gpu_bo(state, a6xx_gpu->preempt_smmu_bo[i],
> > +                                  a6xx_gpu->preempt_smmu_iova[i]);
> > +     }
>
> [Severity: High]
> As reported by Sashiko on v4 [4], can this loop trigger a use-after-free =
on
> a6xx_gpu->preempt_bo[0] when preemption initialization fails and falls ba=
ck
> to a single ring?
>
> In drivers/gpu/drm/msm/adreno/a6xx_preempt.c, if a6xx_preempt_init() fail=
s
> after allocating ring 0's preempt_bo[0], it calls a6xx_preempt_fini(gpu) =
and
> sets gpu->nr_rings =3D 1:
>
> drivers/gpu/drm/msm/adreno/a6xx_preempt.c:a6xx_preempt_fini() {
>         for (i =3D 0; i < gpu->nr_rings; i++)
>                 msm_gem_kernel_put(a6xx_gpu->preempt_bo[i], gpu->vm);
> }
>
> Because a6xx_preempt_fini() frees a6xx_gpu->preempt_bo[0] without clearin=
g
> the pointer to NULL, and a8xx_gpu_state_get() iterates up to gpu->nr_ring=
s
> without checking gpu->nr_rings > 1, iteration i =3D 0 will pass the freed
> a6xx_gpu->preempt_bo[0] pointer to a8xx_snapshot_gpu_bo(). Should this lo=
op
> be guarded by gpu->nr_rings > 1 like the other preemption paths?
>
> [1] https://lore.kernel.org/r/20261030211928.45761-16-robin.clark@oss.qua=
lcomm.com
> [2] https://lore.kernel.org/r/20261030211928.45761-16-robin.clark@oss.qua=
lcomm.com
> [3] https://lore.kernel.org/r/20261030211928.45761-16-robin.clark@oss.qua=
lcomm.com
> [4] https://lore.kernel.org/r/20261030211928.45761-16-robin.clark@oss.qua=
lcomm.com
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102220405.30=
730-1-robin.clark@oss.qualcomm.com?part=3D11
