Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC604CE67B
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789500502; cv=none; b=jKftOv5q09TGjiZZ01xdmaWAM72uSpDMjjyBBeYXfUCDJjNqoRrMCCORzHrHye1PL2hVVcqANXj3nMB2clhYG4tHGXq2UAylOXyFyl7h8F8aNIRG0PhhLpasOpGbQxzjEu+Rf5MHUuKjfZ2gCFe+Uuu9kWkkkdl0uvdI+L5ED+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789500502; c=relaxed/simple;
	bh=N+4D/99f1HY4sv3tB3meiq+ncE1mGIAIII7oB6KO6Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXorf1ybovy7LsrXRTHeXPkTJeqJ7cpaP1RN1jjRiz2iI9Dw9PsWsEwnNACS0nNU/TK9UMRH47cozwD9t0s5boVZAwCLJxsQt+Jvf8JXEJYiGFs6lj3j1howRnTizcGiPaEb4+oXDDUuAq5JuBYD6Jfp48hsNqfY7hBAX2WRKbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMy2FBGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Egx36smK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMy2FBGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Egx36smK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FItaaI1528372
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojaDUPtHd9cNx4slbCoFV2pZnXL+A0EcEEXwY6+H/Z4=; b=pMy2FBGg0KSMyQ9c
	PHxpTC84ELI/yk0d6Vbgiwt6drPpMKNfm/lMfhoOiVcIj1OhWUHh6xIfcjDtFswZ
	4yGgY7oWZVPyu4lIICecP2XbL1td1XZkk6VHIAp66Kwrj3Qw5IC52tF5PXTxOGjx
	DZm1QIVkDn9owl4UnxDHvaAFwcmhMKCEmlfAX/6aqMIYdbq6pkeTnBMg4ryjSd/7
	cvXrGDgsEqQTktkkhc8of97xYFVK1V0xlrLa0OUdCTmX961+cdrmfdY/9hCUBLDc
	nMjQyp2a8tMboW0zp/tfxMYHMiXQubsrMwn+Voq2ICDX1U9PoqnNfV/c4hWNNqSv
	Tbi/Aw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea3tx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:28:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6406278a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789500499; x=1790105299; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojaDUPtHd9cNx4slbCoFV2pZnXL+A0EcEEXwY6+H/Z4=;
        b=Egx36smKkc+s2muw/I9NT2aJcaoThUqhsUKkdG+TQHPuVLVD3dRsDroPUYmMHS0BPA
         0KBXs8PZBuhQEFbEwwikElAS2Ka6zZDNP7V7+bWLDFHlj3s4PIOXeMVsNV/ZuilHLE7x
         TciaGJUgP5tV0+Rp/hwYGm4sjHJi4Xu4JQGuOUCd1uVJRIhnHej9q9X0qjVL9Nywi8RE
         bFQEl39NbxSRn/cSrR8Nz9MMq2JlGb1V7CjgxocR3JQahhO1A4k4JD+v+kHjXjDG1EhX
         2Xw7THq82eoVDeqyAdcPG6qfk0zBB7ZKEVZrVZEDbj8IDV2ymmD+1LLbJoOhohTJ655H
         hZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789500499; x=1790105299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ojaDUPtHd9cNx4slbCoFV2pZnXL+A0EcEEXwY6+H/Z4=;
        b=aE0t0SvSiVQkZCYa2a06r/V7P1rUsae+rmZK8ROwlt+ne8REwBVwyA+m5IObWVy4Iv
         OpSham4OdK6bYjx2iieDadXZL40uSoOtMlhyXACxQ9BDn8KAY1MlAxjYj1RfUSq77tO4
         6hWzIBr49vXnqhdpY541zAZAYBUiJ+WmsVOwMclQ9T5mFb3gx+OFt9ztpc+zUIGG7sop
         xaERyBkVT7i1yAHtxECkHlx5WnfIbUA0D7YdpacA97M8mXU1u70vLhxkmwGLHgm+XZ/f
         UZR29FKzQnW3xUDty+FsqDB0r++C9dUUuqfcFQbK10fgZrRovfWB2V4gEfylOTr+SLYa
         XqXw==
X-Gm-Message-State: AFuF++nNXhJDxC64rhVVpSsNbuamw7PkwG2COajj6MPTKn/wcSBJn1MJ
	LWUAEC0EgFTq/OnvfizHmj1IyhQX35+D2IAX3RoXl2Gp1dpgK4GO04gsOqfMy+w+/pcIVroGjuy
	CJ7DuQ3toLPchNbhAH0a8lFIcBNG7YQUVFhbVW6qsbgv8Zvg3YH+Q06btlWWk5RPMV3YZZ1+vWm
	9YBEE=
X-Gm-Gg: AYBFou0CbwQlmcgpOJM30f7WwEEpotRnhyIlqpxn8Idoh1+K6PTtl5GMD2eoumSIR3A
	FsnTgzu5IeBbpesj/Z1pajnIgk2ZzdLtApvRwAYxvTbCSrrQ1vIQax6MlkvM4e7gcCxh5gyJj7a
	TJxMlRAp3U/rxg3n9YD2osWveUP9TZguVdi+JlOPgsRwF9VN2Fp5niFrcLdTIItMwjJNbY8LNQB
	W/mZKcb/bgFJaDO3ASjyH3WbUcX3lFblrKP7UpIDqGvTKTCe4rV3kLerCfg3nc/6XRG69Pb3hoW
	lVW3tzbcEP2Suan3DYh4/8DDlfCf/1uMfjIoPRS5HuYTsQQjhS0uy4RAICJLUESNWC4Vj1SotmS
	sXXDJYOrYD1wC3/fqEBSu9kts0A==
X-Received: by 2002:a05:6a20:b40b:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3db405976a6mr19102815637.21.1789500499074;
        Tue, 15 Sep 2026 12:28:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:b40b:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3db405976a6mr19102770637.21.1789500498610;
        Tue, 15 Sep 2026 12:28:18 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d76834sm782199c88.14.2026.09.15.12.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:28:18 -0700 (PDT)
Date: Wed, 16 Sep 2026 00:58:12 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v16 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aqmcTK4vyKX/J7dK@hu-mdsor-hyd.qualcomm.com>
References: <20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>
 <20260916-lt9611c-v7-v16-2-c65042fcd245@oss.qualcomm.com>
 <20260915190337.607831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915190337.607831F000FF@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: 9GiOjdzm19zWJl0ZCY99l7H4HtxH63h1
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa99c53 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=JW9JmUXexGuFTMD2F-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: 9GiOjdzm19zWJl0ZCY99l7H4HtxH63h1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4MyBTYWx0ZWRfXwLkE/TvyEy6h
 L1jU4cD/GH27BDI2meyI8o/pU84UVcOkPvPWERzl0+boHhb3ePGQOxkPMU0Zjudi2lKrMB3UWzN
 s/qMH7nL1BRGj1+vTr3k2WyeWXck8Sg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4MyBTYWx0ZWRfX9S1cfoCO5PJr
 6cU35bSs037ypq4MkIBmeLx+uS68OPzG+2dsd2smiWeal/fJHqtKi2A0qLtYQS0sKZGtyTew8Ng
 BbowbXdTASVG7xzhrVKKYzsmSB6qy8YSo+fDY2p2qva99CaJuKZtOnn+KWwXn/y/wj9SJMnK/2Z
 KHNMGglJ2V+yh8lxfjNeTMK9dumFgs044Ue0soBEpy1L2fjOE+w2ymm2GJ9pOXxT+LO0miVpIQJ
 hjrI0pEqa9amaaN3ZyVM+XmljIiLLQ8E0GoNp8LwvxpthKZqYHIx6lF7NByPbVqEePGaj7RsnwR
 m9vCr2TCwexGP7qlfkJBqphYg2HMm17M0aX/qdoD06Zi2aLMMK9srDoIcSuQEbfM4jauEJx1EY1
 saEmow2OsP7N7VZsxk1t7V6n4YyRZ/MUUpiESN7TY67t41AwNtbdA8gg+LbZQMWKiXQPWq/KWrR
 jK8oFWTbQV2B1izXAJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150283

On Tue, Sep 15, 2026 at 07:03:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/bridge: premature bridge registration causes UAF on probe failure
> - [High] drm/bridge: missing HDMI formats and max_bpc initialization causes display failure
> --
> 
> commit 845a14001f40c5c49616eeff3efbd5f04313cc72
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit introduces the DRM bridge driver for the Lontium
> LT9611C(EX/UXD) MIPI DSI to HDMI converter chips. It supports single or
> dual MIPI DSI and I2S signals to HDMI output.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..54ae535339f74
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > @@ -1160,20 +1160,20 @@
> [ ... ]
> > +	lt9611c->bridge.of_node = client->dev.of_node;
> > +	lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > +			DRM_BRIDGE_OP_EDID |
> > +			DRM_BRIDGE_OP_HPD |
> > +			DRM_BRIDGE_OP_HDMI |
> > +			DRM_BRIDGE_OP_HDMI_AUDIO;
> 
> [Severity: High]
> Will setting the DRM_BRIDGE_OP_HDMI flag here cause connector initialization
> to fail?
> 
> It looks like the bridge.supported_formats and bridge.max_bpc fields are not
> initialized before this is set. When drm_bridge_connector_init() calls the
> core helper drm_connector_hdmi_init(), it strictly validates these parameters.
> Because they are implicitly zero-initialized, drm_connector_hdmi_init() will
> return -EINVAL, which would deterministically fail the connector creation and
> render the display driver non-functional.
> 
> Should these HDMI capabilities be explicitly set before enabling the HDMI ops
> flag?
drm_bridge_connector_init() uses safe defaults when bridge->supported_formats and bridge->max_bpc are zero — it defaults to
BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) and 8bpc respectively (see drm_bridge_connector.c lines 826-827). The bridge fields are
only used as overrides when non-zero (lines 911-914). No explicit initialization is needed and connector creation will
succeed.
> 
> > +	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > +
> > +	lt9611c->bridge.vendor = "Lontium";
> > +	lt9611c->bridge.product = "LT9611C";
> > +
> > +	lt9611c->bridge.hdmi_audio_dev = dev;
> > +	lt9611c->bridge.hdmi_audio_max_i2s_playback_channels = 8;
> > +	lt9611c->bridge.hdmi_audio_dai_port = 2;
> > +
> > +	drm_bridge_add(&lt9611c->bridge);
> > +
> > +	/* Attach primary DSI */
> > +	dsi = lt9611c_attach_dsi(lt9611c, dsi0_node);
> > +	if (IS_ERR(dsi)) {
> > +		ret = PTR_ERR(dsi);
> > +		goto err_remove_bridge;
> > +	}
> 
> [Severity: High]
> Can this sequence lead to a use-after-free if the DSI attachment fails?
> 
> Because drm_bridge_add() makes the bridge globally visible on the bridge_list,
> another KMS driver could concurrently discover and attach to it during this
> window. If the subsequent lt9611c_attach_dsi() call fails (for example,
> returning -EPROBE_DEFER), the driver calls drm_bridge_remove() and returns an
> error, which triggers devres to free the memory backing the bridge.
> 
> Could the concurrent KMS driver be left holding a dangling pointer to
> devres-freed memory? Should drm_bridge_add() be deferred until all resources
> are successfully acquired?
the DSI attach path requires the bridge to already be registered for endpoint discovery. The window where a concurrent KMS drivercould attach is extremely narrow and bounded by probe completion. We'll leave the current order as-is.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com?part=2
