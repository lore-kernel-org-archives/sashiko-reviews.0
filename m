Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6910448035A
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807889; cv=none; b=qqjY8gRN+X0SuqvJb4Ta0oRsjhn1wPv1FaZ/Soh8yL2xp4cHynafLCneQ1GUTyZIAGkF/414iPr/Q94HX1RvBmcQfeHdcev1cZj+WS7NewydbdOlyeT0Wh48wuJXr1p1coUuStUC0CNhuEyV/XRXU+OAAuvmlKkZpjrUWDZ+AnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807889; c=relaxed/simple;
	bh=H5rSxCEa8nPGc8Jt/z5JkUPV4TKxgSMCMm1I2PZ27mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIyv1QIYNlIkJRTfIC/6XakiesjaM7ulBbEuCyXwoWpi+PE+6OhIdLFJ8UBkUIspNzIY3Adkyf/JNhLyPZ7v60Hl/b7TTyEknD1AI17C0PCC/fPSfY2ogPLfPhgHrq9e+ji0cgtV4WjUWobOGD9/mz86okufnF6M/zRT6RfWLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/3W2iUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cc5SP9nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/3W2iUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cc5SP9nx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0bkM2679930
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GJT/DkiIpi+sKlIcqZxCDbCI
	/Dpo/QRPmr7TBBKi1E8=; b=C/3W2iUOkR2KCADsqS/uhtOy8u4bS5D0ffQCMWHb
	uUch9DZW/R9u2TKkBKf95zq3R8DbXA2NSSTTHmz/DKnWb9Dcp5Nym25rgVi+c1s1
	EgZ5/U8VWpc0biuiG7rBPd7fgiR57Bj10sdsVXRe9c2Z7B1QoxvcmxiPMeIMEFlR
	ynPMx+L2a94kcISVeIPsGonCnW0OQh8DQ5LHBnTQr5JT4DhlXjUqpREFAF3djC1c
	iJ9Sxj551YfMtbGKjbWjxnBEP7vfMMaNBFo7xtyI12ieJSJq/x2VPNkchu3T9nW1
	U4hMF7As0zR1+NTi7UQKeK/zHpjPAfwR/XX4iEHscb1gqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1svxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:24:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so327871285a.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807886; x=1792412686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GJT/DkiIpi+sKlIcqZxCDbCI/Dpo/QRPmr7TBBKi1E8=;
        b=cc5SP9nxXthaYN7mq6SBSE7hM+EGO8pHUq+iGlrSYsPORW3acSYT4lQLmcRwskLubb
         OS7trmMGH5xmErsQhKAuqK9H0Xy9M8NFXiYWIovXzuVQq6g4MXdn4SkfIhVnBJVH959k
         uY5wew0V6bzf6aKQ67P2UMhlm0oGYQJOTSW7dU7tne+Lbo7P+hqq1Bk5hznhIzLhUp1M
         vt7HMBiqe/mUlZ4n2+skJT++HB9weofSHaeB17ptOfkb56SvYxgTG8ZcP8eIwI40535f
         HsYc50wF7OrHkbZ1b1UT0Zz5OQndp6pBEobQucMwWlKvkAepcFLXusMWXd4w4LfldMKj
         UueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807886; x=1792412686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJT/DkiIpi+sKlIcqZxCDbCI/Dpo/QRPmr7TBBKi1E8=;
        b=H333uxHJHSmsIAA7Wv4EbFmAMDbUkUqolUfFoetVX5OoZp2Vu0vE4tdAzVTyxaHZAI
         7q5qNuKt+4Pkj7Y2njT4dpDCe9LlTMdhCFyYYZKRpjsnHwCzGBVJ9qrPlFovIyKY0tdN
         LA8e6r2acaE5YnBwvUKqOQQzOwV8MXUbaKuDUXIdPmkUQv8rZseATH9Vcj9Df4UqbDxy
         bWf3hPVGaAEkNJE/XvmFhb8HGMhcvwJSRkacXUZlKeBucGE1CVE/Wh1AmnrDBQOMB6XA
         im+IBEMMMdkGpl042FXHRHUXQHrd1BejeoNdguLz0ufQvzy0CnldCR2EVHmQAEtlqa1P
         ECQQ==
X-Gm-Message-State: AFq9FYLh+pa+cswbhUbYxeu+1896oQ4bSll5hWFBCoSmOjfCViXLU9UG
	PT4H5/3HOcwvIKigUnrvzzlkWqvh8xeUEuAgLNBT6cFX+EkphIH1E1hV/xYhVVm/AkwsRiMgpid
	pszl5iwx9i2tpvVdxyEN1fK0SsgsuUXS9q1vYOQqozoPsPdAnDYpQBL+pEVymGgCY93ISbBc=
X-Gm-Gg: AYBFou0iVC2ENFHZF3eMLxVFjkD4eX2iAaA6xU8M2QAMRiO5B1mk0cYFGEYvNkV7HnU
	O7YYMcJBdvIydvVHGJKB9l8ws3YJkizG5J4pm3gsWJwoCKYroEbrJ1/3GqxPYtASW/lcZBSrkSI
	76F0c/6P6ppmGpkQXAPAf+xXMha2BunmpVrlmbOu3aPXaLkbUP7U9WXdq3HhySf3nd1zX6c1CmN
	VCr+ezB+EFuuW/UwscOWBONGl2Wv0t1rzi/q8GO0gfNcqs91tLFe87b9R/YwfcmtDi9gwQ0JV5M
	4ZQCwpQseTF94TSBh9cayc1N7vbKM+pqf+4BSUett3sFrkT/vXybsFnF4zD7shwKIMprLPY8LmL
	zLX2ZEOXZep2eNUUgCESkx+/W00mL8XLTTf3rXPe6kMJeKQtFMgGctKA/t0JVtAhdUwUd7/gs5x
	muTgoaM7mxYhAH
X-Received: by 2002:a05:620a:a0c1:10b0:93e:c12c:4415 with SMTP id af79cd13be357-93ec12c4ac9mr1057654685a.81.1791807886427;
        Mon, 12 Oct 2026 05:24:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c1:10b0:93e:c12c:4415 with SMTP id af79cd13be357-93ec12c4ac9mr1057652985a.81.1791807885921;
        Mon, 12 Oct 2026 05:24:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9dcdf4545sm13169001fa.25.2026.10.12.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:24:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:24:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 12/35] drm/msm/dp: add support for sending VCPF
 packets in DP controller
Message-ID: <rd73b5ovrmqlanussaj5cugi4fx5yzuvwam2kzcizdiusmxzib@ko5xasxrjrzx>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-12-4b81473185e7@oss.qualcomm.com>
 <20260929045000.55AE01F000FF@smtp.kernel.org>
 <t3klzrnzq3oicg6djkv6ixwy6oteo6c6zvnpddbqk5pjhsodoh@qz7pcou23no7>
 <f7e864e9-8500-430c-8f02-915a162bd2a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7e864e9-8500-430c-8f02-915a162bd2a2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QDo_yzYMfBKiSB9Dk1R94ceed2PBbrLs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX3vQdolAQ3yXB
 62L44+g8x8F5ZPFCVqTP3iXUbnglWSYV2FzlXZRjKaiS7vIJP3Da34+4fYDSL94SwmjFRmmA1wQ
 f1xG0URIfr68Sj+CeHIKyVCimYy0p4A=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accd18f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=eQdJkE7PAM9i5_T_09wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QDo_yzYMfBKiSB9Dk1R94ceed2PBbrLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX/TwcufLJlOlh
 PCtnW8lFvNXn19yjnPau0SbYUWkmbUNAfxo64I8DEY7l/CaSKE31UR7/ARjNOr8GLSnuk+kWG1v
 F+yY+zz3zbqMeFibHdf/F9XC0p/yNeIK5/9c71Hcl85Mw+xN/Z24PYA51BPWNkAiTziq/Hdip61
 9bZheoVvL+ESbmMLq7YWN8lz3b1vsTTNvmPaLJwsmCjIRrnq59yPGfxYYEIAYAXjNBuym3+A2kd
 w7/iGmLtCKFlvhUpp+rnhmE9ld0MBVqAvm1T/eWDkEwoCLZ3YuIZy8b9CADClmdWYuU2NxxquL8
 lU+izY1kUVYnn+7ReagMxiYgjz3laP8lUWOWQWGwBh8LSNxOuGZAYqdI8hKYKcrYtrQOOH6H6q9
 FBJCTKJRRBM9a2b7eMgldvDiU4VSGuIGsB6sDiowjzSuJgFIUx1bs9vdbEWxWMStXcPU5Z/QspW
 lNqc9UJfbqNhiehlSZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120049

On Mon, Oct 12, 2026 at 05:08:53PM +0800, Yongxing Mou wrote:
> 
> 
> On 10/1/2026 6:34 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 29, 2026 at 04:49:59AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] drm/msm/dp: bitwise OR of STATUS5 and STATUS7 without masking in ISR
> > > --
> > > 
> > > commit 987123505b6cfcc4664c72feae6b070ad91b79a8
> > > Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > drm/msm/dp: add support for sending VCPF packets in DP controller
> > > 
> > > This commit adds support for sending VC Payload Fill (VCPF) sequences in the
> > > MSM DP controller when stream symbols are absent. It introduces interrupt
> > > handling for streams 0-3 using the STATUS5 and STATUS7 registers to signal
> > > VCPF completion.
> > > 
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > index 9a0c9737e6d00..929e0f94f8ddb 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > 
> > > [ ... ]
> > > 
> > > > @@ -2801,6 +2877,16 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
> > > >   		ret = IRQ_HANDLED;
> > > >   	}
> > > > +	isr = msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(ctrl);
> > > > +	if (ctrl->num_pixel_clks > DP_STREAM_2)
> > > > +		isr |= msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(ctrl);
> > > > +
> > > > +	if (isr & (DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT |
> > > > +		   DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)) {
> > > 
> > > [Severity: Medium]
> > > Does this bitwise OR of two different status registers cause false positives?
> > > 
> > > The msm_dp_ctrl_get_mst_vcpf_interrupt_*() functions return the unmasked
> > > register values. Since the values from REG_DP_INTR_STATUS5 and
> > > REG_DP_INTR_STATUS7 are ORed together here, bits from one register could
> > > overlap with the VCPF bits checked for the other.
> > > 
> > > For example, if an unrelated interrupt sets bit 18 in REG_DP_INTR_STATUS5,
> > > and it gets ORed into `isr`, the condition will see bit 18 set and assume
> > > it's DP_INTR_MST_DP2_VCPF_SENT (which is bit 18 of REG_DP_INTR_STATUS7).
> > > 
> > > This could cause a spurious completion of ctrl->idle_comp during a VCPF push,
> > > allowing the driver to proceed while the hardware is still executing the
> > > pattern.
> > > 
> > > Should the return values of msm_dp_ctrl_get_mst_vcpf_interrupt_*() be masked
> > > against their respective VCPF bits before returning, or should they be checked
> > > independently instead of ORing them together?
> > 
> > Please respond to this comment.
> > 
>  Thanks for pointing this out. The issue is valid, and we will fix it in the
> next revision. >>

Please respond to other Sashiko comments too. You got a review. It's a
nice practice to respond to them (unless you agree to all of them and
are going to fix all of the findings in the next revision).

-- 
With best wishes
Dmitry
