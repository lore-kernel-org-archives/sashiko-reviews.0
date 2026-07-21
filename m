Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650672DF3EA
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784660053; cv=none; b=RWAe2VYPo3u2u91TMQq5SlDLV9MpK/7SBFQqF8nLNvNvh91mhWUdBVk+5smkWF+phIk51X8nako8p5fc2Sii5+0hFZdvk9+Hb85f88R95pCeppgz8xQZcGzhZd75d5AlgfaLfK3nhxaJ1tctzXnG5lT/GTZKr5PlGcNpfL/Nr1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784660053; c=relaxed/simple;
	bh=oFRj4kVXMCen1ikcYu7lSJboY1GQnrYKe4ZK3FX/XWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLTvsboue0Se39oy9cYyYdgJQKwL8tWYtNz7xYQWu8/4RCnvcTW4GsOAxbT/KMVEXNLj8zJXJsmVZ87pCAsJCpQLzDDqmie0EiV8a4SQx0ZQyVS5c0zuptxyU8/X3+HAvseBMdvvSamicu50zqRPi/RY+SGa6ZZ5nC/Qp82cmiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPb85F0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQa+qJxy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPb85F0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQa+qJxy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRMi92446029
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SMUsR7BSh0s3toLvJ14SFMc5jpWtih5ahRw168rWv9c=; b=PPb85F0rqjIfG+31
	weIRv2CX1QLYry8qDZkKXJFXcdc7ykanrMT4bXQh2Rzk6XSvA/ZF1frZQ1UIX6/d
	uX5FmSjChOAGCyxafmKV7fM6maSOadtOVpBwY4ysGN8NhwQ/7n8mYgQQrTI2PJ5U
	O/NUB57owXbbZqzWSutqk2erdmMnEJTkCQFdK9t0jy9lHejD4WrtYZfuCmTuXZVq
	fi7d5bU8I8sLt/Un0tIT3Gubc0Vkp2bmZSZYgWvEMmywhARl4FYMIlERN2vCBb0T
	d2/u43SfYNU2buRzja68H2/O0x3cH2cj6QgZqUddzLBS/RGp0cKTdKJC29tUQDE1
	+PVgPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d0d7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:54:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so105009681cf.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784660050; x=1785264850; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMUsR7BSh0s3toLvJ14SFMc5jpWtih5ahRw168rWv9c=;
        b=EQa+qJxyorWl9jfwicX2S0DIPBBuh/e4ILfm4pekLK3tjgprBfgpWXLYc3eilCO5pj
         XQR8TwCXrDVaSDV+q8w5ACQMFawsBRyMKp9SXWid1OX/Hv/LlgaRCh5w10oMnLihqB6e
         V1sgA/kTf7u7mc9dNjetQh3oJrQasF/vVnUkg9JFAHw6kalGmPRz9+nV4EoCvWYVB9C+
         nMzz6AN82fe1uDJpHAmdRQKYeNryYCd75Qnjfefvh94Kq2kS3iw17FXVJPpizZTMTyYX
         HRNJXwq60Q72zNnvkF7U6Z+uhmyvD6c4KPVGaJXuyNIuL/F7g7s4HatS51EGnYFzSzPY
         VqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784660050; x=1785264850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SMUsR7BSh0s3toLvJ14SFMc5jpWtih5ahRw168rWv9c=;
        b=EljNieRD4Vz8Et8+Z7pvYf02qy7ZwZzqIpmrmtc4whaQfMsz9lD/npmu5seOLv8P4a
         yrLblM6liSBtHmVXU7oPWYnpKkCFrwXr258B59L7oKwHq5+gqNqT5d3QzA6jSt+e3ppS
         oT30s+qZYT1ui179MMZVexix/c2l0n7qT6//+mn89vY/QD1Tb0iYxPHphSKr+wbdFGhC
         qY+2ua2ME8DMFvlKVNf2/0HgObOhRj79qFzcs30tjzKH0kFkFnfEYgNJWAEoVU4SNptk
         OCLIdyX7oURShvqVxpuPF7ORsVwb0js8lzsi7QHw4fYwEzTrxzvOX+1BCwnSyzzXawzi
         0Hrg==
X-Gm-Message-State: AOJu0YxdeZCziUdVZ4ze164fjf/zuMhQagfNhbNke4PuhVV8Kd4wQH/p
	zs9rpVi5QMqAzKBE8NqkWCxfbhO0ODf/1is7a9Nv+LjlgQYhM/wru7W+RuHWX18oAdFdq1kya9W
	oxvNBsGIv8cs483U+9sLAOtIaBlS3GA4rwSPLB5lVMopPo58OGohHURdb4dtVHXQyT7oyhZelnf
	M4sII=
X-Gm-Gg: AfdE7ckELZXES8qVziwC6xYq3iS1hQbfeyIpkJSE8rN1Ut/70rT5WUNXJ3Ta97YOlYV
	tMUgBVcF+L4sp2oZsT/D2g4n24kY01hcJjvAmyR9mCBQk8aGk8h4Gp0mC4iQobCisXarwKPjolb
	HqvckKHwvOl8GkEx3EYua93sGKhMNKY9AOAwl0+zhplk0eAO4s4cqVlkoEsdqwEkP4Se8la4o/F
	rIb4J3KvFHMmlTnCkrpzhSsO3P1c623FgfChdVuxWT6/NAtWrXLepED569/wmXfKoMqF8Ma/z4i
	9w5B00ir/xqlH18cb7JAPB0uY1eGxFuW4fvGtKfxYlqosl/pBlHw6Nqpc+C8iXTNeW7+Cu7cu0H
	r6JRH1c8wVol2NYHoEvkq6ExZz3ht08QCqgBTz35wIEtlvYj5kkLZovKht6qkdBFVhzRSmEn6tP
	QsvSDhCq3eimiwsw==
X-Received: by 2002:ac8:7f13:0:b0:51a:8c99:1f17 with SMTP id d75a77b69052e-5213eb8266cmr182508311cf.70.1784660049715;
        Tue, 21 Jul 2026 11:54:09 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c99:1f17 with SMTP id d75a77b69052e-5213eb8266cmr182507991cf.70.1784660049206;
        Tue, 21 Jul 2026 11:54:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9ba342esm74873e87.27.2026.07.21.11.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:54:08 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:54:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <3k7xz57peytyda7cvzfpao3j6xuhn4gyf7f43wnspdpgnrel4r@vipemh3nkoi7>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-10-bea261bf4e7d@oss.qualcomm.com>
 <20260720062405.E079D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720062405.E079D1F000E9@smtp.kernel.org>
X-Proofpoint-GUID: Dkk4MTgf6RQtdmv5EG381FhTju7tZVXr
X-Proofpoint-ORIG-GUID: Dkk4MTgf6RQtdmv5EG381FhTju7tZVXr
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fc052 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=fjmCN9aIutHrqzZMW0YA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5OCBTYWx0ZWRfXy+Ibc7+N+YSH
 tPJegSL/xjJyjPwQSPRhFiGrMw4Adgstxvd262FeF0rIIaiADiKXWbTuTXO6Dse+4JIAXn7Bsho
 xWxXB5QTCEG7/y+Dgdm5Nz5jLzdxqE6J0i3sTo3S8ycYnYVZw/DpE+zg1etAeLuWImV/CH52dyI
 Z+LpqA/whxlP8S57v/VDp9Mnt1yjcAOWN+cq9kwqfzIzg8O+YaVXuT6y4Dkgg5ncfrl8DvuugiR
 4B7sTBYMJVGWYuaYTTGw77kOZuNYNDZd5yxmggHhjN05bL23TgJDW32XzieeE6s5NDRSRbh9a4l
 YXWDXramWadZcxeR92G0jgAIWmW85r1XI9RRcUQ3vmk8rAft8seldFI/TfvaDt8ICEkxlhhBTzr
 MhX5JBNtp7efHGUBj0ILgdHCYklAPbDhCuGZx/62+kOTxGjWa5bnWGlpTAMKgEm/KMbyvuu/Uoy
 y3GgauvJx5r/M0Sznkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5OCBTYWx0ZWRfX325YbRYEEg+7
 0npzdWyFFe6iSvIdDybLXa/b6DQK6oq9MRfZXHbLlPLm1f0eX2wJWPZ8vxa52SBGSH1N7L4cKsf
 ONKr5GB5rWo33hfmtdX/JlJiwKDpxbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210198

On Mon, Jul 20, 2026 at 06:24:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Secondary stream panels fail to have their `hw_revision` initialized, silently breaking controller-specific hardware workarounds in MST setups.
> - [High] Stream-specific panels are incorrectly passed to mainlink APIs, corrupting shared link state and misconfiguring the link based on leaf monitor capabilities instead of the MST hub.
> --
> 
> --- Patch [10]: [PATCH v8 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it ---
> commit 07d3f4b80ae5875a958a8aceb22c9ffab07db108
> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
> 
> With MST, multiple sinks share a single DP controller, so a cached
> panel in msm_dp_ctrl_private can no longer represent the per-stream
> sink. Drop the cache and pass panel explicitly to all stream-related
> dp_ctrl APIs.
> 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index ae79cbec26d19..207643fa73063 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -219,7 +219,7 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
> >  
> >  	if (!ctrl->hw_revision) {
> >  		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
> > -		ctrl->panel->hw_revision = ctrl->hw_revision;
> > +		panel->hw_revision = ctrl->hw_revision;
> >  	}
> >  }
> 
> [Severity: High]
> Does this leave the hw_revision uninitialized for secondary stream panels in an
> MST setup?
> 
> Since ctrl->hw_revision is populated during the host initialization for the
> primary panel, any subsequent stream panels passed to this function will bypass
> the assignment. Could this silently break hardware workarounds that depend on
> panel->hw_revision being set correctly?

It does. This should be fixed.

> 
> [ ... ]
> 
> > @@ -414,10 +414,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> >  	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> >  }
> >  
> > -static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> > +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
> > +					 struct msm_dp_panel *panel)
> >  {
> >  	u32 config = 0;
> > -	const u8 *dpcd = ctrl->panel->dpcd;
> > +	const u8 *dpcd = panel->dpcd;
> >  
> >  	/* Default-> LSCLK DIV: 1/4 LCLK  */
> >  	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
> 
> [Severity: High]
> Can the direct write to REG_DP_CONFIGURATION_CTRL at the end of this function
> erase stream-specific configurations established by previously enabled streams?
> 
> Since msm_dp_ctrl_config_ctrl_link() is called on every stream enable from
> msm_dp_ctrl_on_stream(), it seems this might overwrite the shared register and
> corrupt the state of active streams.

Hmm?

> 
> [ ... ]
> 
> > @@ -1810,11 +1821,12 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> >  		   str_on_off(ctrl->core_clks_on));
> >  }
> >  
> > -static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
> > +static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
> > +					      struct msm_dp_panel *panel)
> >  {
> >  	int ret = 0;
> >  	struct phy *phy = ctrl->phy;
> > -	const u8 *dpcd = ctrl->panel->dpcd;
> > +	const u8 *dpcd = panel->dpcd;
> >  
> >  	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
> >  	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
> 
> [Severity: High]
> Is it correct to use the stream-specific (leaf) DPCD to configure shared
> mainlink properties here and in msm_dp_ctrl_link_train()?
> 
> This appears to misconfigure the link based on leaf monitor capabilities instead
> of the MST hub. If a leaf monitor doesn't support features like enhanced
> framing or downspread, but the hub does, could this break the link to the hub?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com?part=10

-- 
With best wishes
Dmitry
