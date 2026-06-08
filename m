Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB5D385D7A
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 06:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899138; cv=none; b=R8n+eRxTikQ07T2vOVZOnGWAbtqToQNLRa9AMs1gzdewnupM1NwTg9nCtZzso92cWk6dyXicWq4ptjo0BpofrVSjHpum1MT8yJClkjmpEvxcJqcuWnUUAsaHuMmhhI5msS0kU4kW0tUZWdZaCREfMVX7cwGQsf6gvyc+r+YO81w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899138; c=relaxed/simple;
	bh=BS9WL5W+JyESItkj3KTpSH9i28h3pJ2TIOPcK3vG12c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iw9E/pZwCITVSg1y+UlFDK+QmhLLq96wurYqsShb/WSXg2jGbgb1lwZkJ/Yf5LPXmNcp/sVrw3CDmNgQZ0JONUXhTRQX43KvGTZMh77Fg7PWFHUnyJumuweWaRpuZMYCmRvhwQz5LM733e6otcqtf/XbA5SEc75EmXe4xQ5yKm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5QrppdW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgURe/f7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5QrppdW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgURe/f7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EBjN1469252
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 06:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WVKWxZsnq6xE/GGUlxylGRbf
	kAGhFykn+8ukYkAUUnY=; b=a5QrppdWR8HfJPGIoCxldQjiWTwa/DbcP8h0DViO
	mOCw3RXN0L9ivo59eUzgfT84IpOVdfVgdhEIUgmHF5dOqRI81ULKcvn3ZPGD80My
	ZgC1Gfm+2Ex50TGgTAb7AIMo2B1FWU0P0jQQBYJq0kv+dOn/FKXKjryvj1locdHe
	p/e88rUQKs1x4zf1zpVF+E5EVAzKjyEEDVBeq6MDAPB2m0N4o0zI9eXfc6ogaPRe
	jHU/3gfCEhq9XzgTfT1uSSBSwPvEztSL19Q9IrA7ewDyB7Z6iHuipxK9qLeGwbdX
	X5C2LrcWuWXDQ6t1ISoUBxjNXPLitB8FFEbGg8drJYBXJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwx6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 06:12:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd83d58d9so63219836d6.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 23:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899135; x=1781503935; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVKWxZsnq6xE/GGUlxylGRbfkAGhFykn+8ukYkAUUnY=;
        b=EgURe/f7Q7NEIhFCWCEhCmqEwNoWvZofQrOoaOAWFy+0+sdM71pMcI1R5+wlxj6EHO
         KiPKrGrXBfDtkXXYnRu6s+OdfJi8qTWYOOmb1W8NuKcBfkEVju8JQ/opLVTiif7mjTa4
         wVW6uSJs9tDpRNo61bcjKESbUR8UwfEftJVa7miVVDBVwE1VjPU7sSkWdsnfIq5JQc52
         HUPbGLEGayOER/5nBGAYFfiIhXLK5uWU30VUYPjhQDF9CrqkTjiSucYDK06W0/EGiDZ+
         PKBZCGt7qrf+dsjewDywjKzuSmnrW7dR7+AF4OV2NqEdpYDr00IDyZN9dUCwXvdp1nnb
         3YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899135; x=1781503935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVKWxZsnq6xE/GGUlxylGRbfkAGhFykn+8ukYkAUUnY=;
        b=kGVFYaO1TAVJmFKQNYDwXo6q/nYLut2OUuRfH95QiMPp/r+H5EdtewaPfAYk4o8TFU
         8ZBF5xUxPxJcGPT1kVSgIf4zaCE80hz4ZDoXMSSImVJTRvSBjAXdqSCBnhJPA05zs94/
         p9+/NR7Dc3/Xjf2yIJcvTFG3fz0eSgY6NBjqa4f6WNR9/0r0FFNj3ygxmxH3p8zzpbzH
         uSO+qf4KaEtoIoK0+kYgJtz6W47V0TqjPFSMmai04bfXdpA2yl/gEjQbmsdhRtlNtjcc
         gOEtXjOMC1RQuyI//hZsH+vMnS0cargP8WNWtbcrtW6LEDcAJeaknhN6Di3jHTmBRNOu
         5RMQ==
X-Gm-Message-State: AOJu0Yw75Ui+pb7c7th7O5gceVPpZKJOVpQyYNg+Gg2vqZJQemAsR7RE
	5YZ9wicTfgRvtNlDGxKK+HqwR+g+qnbl+WsCl00RkMWxIYholJG6F8avh0LavtoVENrtxwxtt5k
	NcpzBDqRNNTqHog9Wfj9INBdDabA79uebbLyc71tc2qy00h4nKaxOBE37ESE9/SEbWYI8xTM9AF
	wzZgw=
X-Gm-Gg: Acq92OGAsXmZdOrX1oi14oMXEF28koZCvRrJr8HsC/f/ftT/cXJl6IYUgLORqnlgb+D
	LKmTFV1/IpfMY1nIi2BMt7xTV7MFgCw+BMDC+gfGYCBEsS7ZjLJu3BjzTaxEWn/ChPQlyZ02RI/
	7Z/OSWtsLVTlNuw/k2Bpxh+UHoRHzeWKEphAJ6F6tEXr9nIg0+GS7L9Nis37Ur7yWRN7PpGl04X
	6B091P4PVOyBsInUESxqOw1Y4GVDaWGiPnynKsoqg8jzVsJ3VrsJ+wPBKh+l0TBDlMznvPIDt7p
	KQ036SkSkkDtF6M+wAkHzJyQdMrTmLFsTi7mUHSl9A2c0CijJ/4Ct5PVI2JSyD/8KeKXugJfy7g
	9yfg6uv+LqhChYF3C7i6ZEZkaiwIPK24LNan6pOotX+ZcSWMgtn9fwTbylKtKOtv5qSzPZlzsbE
	90QzEXcKTBGy5Aw8FO8+pQ57K4XZugm0syTLAP9ydRFcpmrA==
X-Received: by 2002:a05:622a:1388:b0:516:e031:9343 with SMTP id d75a77b69052e-51795a829e6mr195423271cf.11.1780899135479;
        Sun, 07 Jun 2026 23:12:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1388:b0:516:e031:9343 with SMTP id d75a77b69052e-51795a829e6mr195423001cf.11.1780899135009;
        Sun, 07 Jun 2026 23:12:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be2absm43191071fa.23.2026.06.07.23.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:12:13 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
        neil.armstrong@linaro.org
Subject: Re: [PATCH v4 6/8] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
Message-ID: <w34p2gevaxzr7do4gxzgqbbrtadnemkzrafcuroeytd2dphrrh@qgw5ld4rpylf>
References: <20260608-hpd-irq-events-v4-6-30b62b335487@oss.qualcomm.com>
 <20260607214829.B05091F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607214829.B05091F00893@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a265d40 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=vviSY2pRISl9Lsm2BZEA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: rkUkGNcF6Tx3AFcTqtHvcfif0Is4ZGoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NCBTYWx0ZWRfX71ecUjTuzE1q
 0iv20ek8P6zdQnfTh59SJZ3jNQd7Q4fO4gkCXx6ohFiwf2Iduo6k+qSqnKaCYswc0o23iE1kKX6
 H6Fs+yWAb51GFJVUHfHJm056b2/sVcpCL7FWQMJXBpSshMbEbq/02uzldh6V3LdlaFQCTRCJg3o
 QLs3AOa1A2eEvm89SqjpS1MVEPnT6YOiySmNbrtgExC4R395HEGzf5rhOXiREr7d2UzynBjWEK7
 R/5k1EM/IzOIVaKbQJ0CQ9+AGsGnxHu3YBPI2hjnaZPwzKvmUHzv0gDO6uv32xEFzhEFgjeIBl0
 mEk70icu/lwhXTSllYWqJYpzVl7ZFCWSC5X8fXntxIe5dOFUHLE+ATzgltaDPUO8Uxscb+I/Fs2
 uBgjsDN2bVm0B7Kh8+l4t8j0dGmQS0t81aoLaqcQqVFsqeYT/4c4J6P65rIIFOh2CzNPNUVMBed
 e9xTG/wbiEE0v6260aQ==
X-Proofpoint-ORIG-GUID: rkUkGNcF6Tx3AFcTqtHvcfif0Is4ZGoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080054

On Sun, Jun 07, 2026 at 09:48:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Initial connection and replug events are incorrectly bypassed if accompanied by an IRQ_HPD status, leaving the display disconnected.

Indeed. I'll fix it for the next revision.

-- 
With best wishes
Dmitry
