Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82D21A457
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048600; cv=none; b=Y2u65PaVVyARFSnSVl3UdrnVL9jevMoXCUk9VZLGp5Ot2B8M9HxzXEMIfSHIsMvsFIoITs3YZp00BkST153/sxQuwA4GGPAzWL85A+Adik1Ut6VB1GKivGwxwmde0a+Bd+HDdUReWTt7RXQCX7gyeK8wAQvGSwQ9TPjvB7EC+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048600; c=relaxed/simple;
	bh=244sNKjnn3AH8IBqNDAVFRqX36r8wTVkQ/BuI63xbB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZK2HB/LxNpOLFKcjKjU7EVvN5n0km9/sfdHTsy3cau8JI/0wW90cEtWkTaau9A3Sz5syEPGJobaLpb29MLXJFRbYD5O0Cm5NkhsfM/4buOkDN6h+ZYd7RLxgCiwJH3XprrM1uhA8RsV+1KSHYCgHixnzt+Q5UDOMmosuauP5Jxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGeCz65v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P0eTebUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGeCz65v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0eTebUt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1AtAw2173114
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZx+XxSsWuqyEZeqeYrlTuUInOwB0nAJBJ9ykK9jmDI=; b=dGeCz65vQI/vthFz
	Z7gz743wVedhyA1MJftEpBzlLMHJTNk/Q7xYP64IVHso4wnA5N3ZX/ZWyyxjY/1c
	383YcK52FuUOCwWTGfmm5yRaabBaNUZs3RTWxyLrXQQzelgXLy1hMRV8k4uB0MSL
	sB2XqUtedXF41eUAYDMQPW/hQv27177PpJsOdzFPfHMnmyQwDbav1OnHUx1ZIvZT
	HeVgBDA1Pcq4Ji7bAtNBa4RFiRvA2ikuJWnNx4rqhf9gvUbGjRjIQ+pOhkjQKNYf
	ZiheZja5pfgRrcfMG1uqRhw1owBt2Zcp3eN3IQth2tWC8vzTDnEUKUDgDDoHktoh
	a4X+yw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsq8ewv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:43:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af306c795so754748a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 20:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790048597; x=1790653397; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZx+XxSsWuqyEZeqeYrlTuUInOwB0nAJBJ9ykK9jmDI=;
        b=P0eTebUtUcNAJUmFdVBoIHu+LU5RgdY4cs1Mbi+X/ebyOSu1teEJRkCz1Fdutx9kX3
         i+dc2eE+ifD46k+3+hKMecGKTKyzafDeUSA6rsvhRNnibvFntlfunhzivBRc5HgDSFDb
         pQAtZpINVh3USthiYGvR3z0bzJz4l1nS+7VKGCdRKEz43Yc87doQRdj9ULl1FujssBxg
         Vt+JX2hPQh2TuUydrYkUmcpKoue7+9uXgA/kC7PAoVYGOGVTinIQnGr3jZpr4bVSSn0S
         Ysjr42LNxvLqHfQ5cOHRC8AG9ah6KrutYERT0hEz/YWfQ5HXmUxILPYbkELpaLTf4Nbb
         FVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048597; x=1790653397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PZx+XxSsWuqyEZeqeYrlTuUInOwB0nAJBJ9ykK9jmDI=;
        b=PkymehOWyN2desf/rVNW3eAHKjnhtNNK/h3HOV1g1XGi00uFEnto4XoaPx/iTuaYzo
         ENfb8T7aBA6sPxIr+gUFiRp6HvyWJrdg1fL1MMtLm6hgkpB9Ivw22nreped3rV0IT7KN
         xqoKc3naEG+V9zST/vwryjooH2ZOkjapYTCMkvXhmWLl3BI5LTfCefMryNUfjQJIFbcF
         GYXPy+eyu9E2BQySM6w2MdLTbB6vhXwmivlPFyiIxAgilqHV6BUwg7fEsM4cpRoIgtzA
         +jvVYyheo311iQvQmF8MK/AiJWyJyfrBHoM3K2c3sIm6ZxQYCLylC19wVCj2ku9bTVch
         HD4A==
X-Gm-Message-State: AFuF++kUZKfJGQCs23B+NzeviGJEgb/O/9XbtWvhYUUIV912b6au4o7u
	maQV52Y8tWddqQIzzYi6gBTY6w3QR+ZgNXcdNIlgjMr0vMy6aj5zwSt7vnDVsJnQedOhf5Wxptk
	amo0Enj7dqY8sJdsFWaVpB7sH8dk6KbPxZcvmUB1qG0vcB0mUJVcZq+f2QhJnh/ie5mFILR7sRz
	TC2rM=
X-Gm-Gg: AYBFou3uvbibR9VP336yH1X4reEXhEDvHOqwSrUAcMWsl3rTNIJzXS6JSiIE9UPASqS
	cPZkxje5aPCfPY1MVdWe+n21GMgoaSU7s7cccByzfoCQTUEsj+V0D/dqhsCKSWj9gyc/GyoN4CM
	mTUrb987ozlNvWAUUDHHpBJMnKvGG3Vfdh4VdQJWsC22AZqxRW2eomnvFLOH4ZiP6eVlM3f83hg
	wDmK/Y0KirgF6qV9c4yCqcf1qaz0SrAHEFtpg8nB8+GOGvI0K8Xe3ZaL4Ao4jWGUwCX0E6HDjZR
	W7qjnnHDxUGet6TV+4RckxYG/egcmr39TfPMO9KFo/p0UxLljCaoWfJ8EKZfF5NU3AQmgziO5lN
	YBsBYZIRguMe7a2Vfv20/WuhNm+6RXhfQPW3eSbSGmAOJ1KVyQxuk49+l7NfoaaPZ6NezKc2ie5
	sleJBFn7AsGXyAMX2npz07
X-Received: by 2002:a17:90b:254a:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39e5940c49cmr23208251a91.1.1790048596380;
        Mon, 21 Sep 2026 20:43:16 -0700 (PDT)
X-Received: by 2002:a17:90b:254a:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39e5940c49cmr23208225a91.1.1790048595821;
        Mon, 21 Sep 2026 20:43:15 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm1165061c88.13.2026.09.21.20.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:43:15 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:13:11 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge: lt9611uxc: support displays with up to 4
 EDID blocks
Message-ID: <arH5T6jJUC4T+hNL@hu-vishsain-blr.qualcomm.com>
References: <20260722-lt9611usc_edid34_misc_next-v3-1-7ec2bba6ff8e@oss.qualcomm.com>
 <20260722125338.383481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722125338.383481F00A3A@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: vblbzTZcXfCiErPYB7bp1Dx-H4ebZq63
X-Proofpoint-GUID: vblbzTZcXfCiErPYB7bp1Dx-H4ebZq63
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0OSBTYWx0ZWRfX6iHI7ODPzu+D
 FRA+69HSCXIEBFkv4p1VSy1S9SN/HOtG/3c0Lueeot5p28wfVM1GsrRQb33SGDJMcxBWYtY4FVV
 yxSCsGW5Me7tMZMDHIGcw6fT3DlnagM=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab1f955 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=4oqKez96hxEG-nBsylsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0OSBTYWx0ZWRfX9542FADBszhp
 qs82p9Asa3Ci66i57yUtxEulNRXYehBSG8UN5MYgWh+YNM/8qCoqOvn5e52Rv66iN0XuqQhOxOk
 i3LJ0kcVU5PxyLvU4U3uk1u4M+RuGYj3ZRmm6wwNWgjlPR7Zoe3up5jV8m0j9rbsx/9KpibRp1c
 5GEVOr7EpK7pLZ/gYj7TSo6MYRWaJcZ1mRRFD6i1YQh+jNgJXOXpAMga70F6yx22rNffMBgHJAN
 sC9AaAHMkXvazBiBmzQhuZ1RYZmfrQAS4di4NL5DCEIcM9jWwzu+8fq4HQxcKmVT+UEoaV2mDFY
 gwvdjoPrR3I393UmwbgAXLHkd9xZR13jDrjZxFoZqeNDijBQ/IOCBPQwkyiwT2dW/k45AUTrvRl
 r2CYqOGcg6jidXghAwepvn6HI5wNLAy+EuLUCsE0iK0+ZNeNIOTkjnP0qbi8rbsEdqMYu2vQvBK
 eRXC1mmpnNfyQbqoFug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220049

On Wed, Jul 22, 2026 at 12:53:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Race condition in EDID polling loop causes torn reads for EDID block 2.
> - [Medium] Strict EDID header matching prevents DRM core from repairing slightly corrupted headers.
> --
> 
> --- Patch [1]: [PATCH v3] drm/bridge: lt9611uxc: support displays with up to 4 EDID blocks ---
> commit 63cb19491161c2c777e55262d8c46894374344b6
> Author: Ravi Agola <raviagol@qti.qualcomm.com>
> 
> drm/bridge: lt9611uxc: support displays with up to 4 EDID blocks
> 
> This commit extends the driver to support reading up to 4 EDID blocks by
> re-triggering the EDID access. It adds a retry mechanism that polls the data
> buffer and compares it against the standard EDID header to confirm success.
> 
> Link: https://lore.kernel.org/r/20260624-lt9611usc_edid34_misc_next-v2-1-24ce3f5770b8@oss.qualcomm.com
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index 11aab07d88df6..20e3383a510a0 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> [ ... ]
> > @@ -395,20 +423,48 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
> >  	if (block >= EDID_NUM_BLOCKS)
> >  		return -EINVAL;
> >  
> > -	lt9611uxc_lock(lt9611uxc);
> > +	if (block == 0 || block == 2) {
> >  
> > -	regmap_write(lt9611uxc->regmap, 0xb00b, 0x10);
> > +		lt9611uxc_lock(lt9611uxc);
> >  
> > -	regmap_write(lt9611uxc->regmap, 0xb00a, block * EDID_BLOCK_SIZE);
> > +		edid_ready_flag = (block == 0) ? BIT(0) : BIT(1);
> >  
> > -	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0, buf, len);
> > -	if (ret)
> > -		dev_err(lt9611uxc->dev, "edid read failed: %d\n", ret);
> > +		/*
> > +		 * Set the EDID ready flag so that lt9611uxc can fetch correct EDID block
> > +		 */
> > +		regmap_write(lt9611uxc->regmap, 0xb028, edid_ready_flag);
> >  
> > -	lt9611uxc_unlock(lt9611uxc);
> > +		lt9611uxc_unlock(lt9611uxc);
> >  
> > -	return 0;
> > -};
> > +		do {
> > +			msleep(100);
> > +			ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
> > +			if (ret)
> > +				break;
> > +			/*
> > +			 * Compare first 8 bytes of EDID header for block 0 and block 2
> > +			 * to confirm EDID read successfully
> > +			 */
> > +			header_matched = (memcmp(edid_header, buf, 8) == 0);
> 
> [Severity: Medium]
> Does this strict EDID header matching prevent the DRM core from repairing
> slightly corrupted headers?
> 
> If the EDID read from the display has a slightly corrupted header (e.g., a
> flipped bit due to I2C noise), this memcmp forces the function to eventually
> return -ETIMEDOUT. 
> 
> This bypasses the DRM core's robust header repair logic
> (drm_edid_header_is_valid), causing displays that would have been repaired
> and worked properly to fail initialization completely.
> 
We rely on the header match purely to detect *which* block (0 vs 2) the
bridge has currently staged in the shared 0xb0b0 buffer, not to validate
EDID integrity - that job is left to drm_edid_read_custom()/the DRM core
once we hand it a block. A single flipped bit from I2C noise on an
otherwise-correct block-0 header is the same failure mode as a flipped
bit anywhere else in the 128 bytes, and would just as likely fail
drm_edid_header_is_valid()'s own repair heuristics or the block
checksum. We haven't seen this in testing, but agree it's a
theoretical corner case; not planning to change the matching logic for
this series since there's no cheaper signal available from the bridge
to distinguish the two blocks.

> > +			edid_valid = (block == 0 && header_matched) ||
> > +				     (block == 2 && !header_matched);
> > +			if (edid_valid)
> > +				break;
> 
> [Severity: High]
> Can this exit condition cause a torn read for EDID block 2?
> 
> When the MCU begins overwriting the buffer with block 2, the first byte
> written (e.g., the CEA extension tag) will immediately cause header_matched
> to evaluate to false.
> 
> Because the MCU does not write the 128-byte block atomically with respect to
> I2C register access, the polling loop will terminate prematurely. This returns
> a torn buffer containing a mix of new block 2 data and old block 0 data,
> leading to corrupted EDID parsing on displays with 3 or more EDID blocks.

This is the same class of concern raised on v2 (polling the buffer
directly races the MCU's writes) - there's no separate
transfer-complete status bit exposed to us, which is why the retry
loop exists in the first place. For block 2 specifically we're
checking that the header no longer matches the block-0 pattern, which
in the torn-read scenario you describe would only be true after the
MCU has actually started overwriting byte 0, i.e. the previous
(100ms) poll already saw a stable block-0 buffer. We haven't observed
checksum failures from this in testing on the panels we have. Happy to
look again if this turns out to matter in the field, but not planning
a change here for now.

I will rebase and submit the next revision 
> > +
> > +		} while (retry_cnt-- > 0);
> > +
> > +		if (!ret && !edid_valid)
> > +			ret = -ETIMEDOUT;
> > +	} else {
> > +		ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
> > +
> > +		lt9611uxc_lock(lt9611uxc);
> > +		regmap_write(lt9611uxc->regmap, 0xb028, 0x00);
> > +		lt9611uxc_unlock(lt9611uxc);
> > +	}
> > +
> > +	return ret;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722-lt9611usc_edid34_misc_next-v3-1-7ec2bba6ff8e@oss.qualcomm.com?part=1
