Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F441D644
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059458; cv=none; b=fC/hUbJKXs3bD4Vy4qP0oEROIMYOM80xqBluDxWCfcElY5NqneQtPxP+5KxtERaSBlys0pk3eLyapkHXG3yhxMeiPm+C9jVnuhYbbEmuHexj5hCQtF6nN5CCKaGKa0eTPoF9CsiF/BX59+ihcwY046iH28Vj79J7OX4HBO3zl/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059458; c=relaxed/simple;
	bh=n/WcsupACQqTUqWrfnHVaoo2uF7h8lK2+wj4dBtojbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmuhKR9UmVKyyh7HnGOtJfRaFA05SYi4YO4UMxARkQwj8OI855kcEsfkhNdXm2gyWyKd/+5nzO7OAJJ3i/5Y1j23S8ww2+Owc8C+mhi8eAeVNZ4MrkDs+fOLYH+lI2vzjROGknrJ0rOWoOBcb1mnRaDeTfMdv4G4MJy/2yZLo8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGnxzLtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjwKQB8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGnxzLtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjwKQB8n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIwKxa1137066
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 20:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmV5ef/knQFkdr12gu8Zgwokga2tkN1Tq7U1CYJS+IE=; b=AGnxzLtInUnlJVx+
	x8AnIE1tFQlbJm4yO1xhWlQ0MaNkfJZMnPOKhx1lMdGySAsMv7ZOJsye2qH6jXlO
	EgtZtuR+THgn3cAMt6AZf+t+kaOlVh5KP5laEJSQSbQN00+E2t5KUV/ESMqrwmQX
	ggDm2Yn/d70ZPOvGyeIYqCo0ZMpIjtHtGlwgQzKH8Zp1bD1MZ0Q8JZmJFlb3oXG6
	pn5fMvNJadwoSAp8lp0YlrjBn2cuvWRVHnr98KsslHv/rdQ5OTiqEVMDPIrtDa9Y
	TQCpvOTJF5CZRY8/LukQ9pfA7F+KfY1ExLqGVjMXzk2CWyPbavQfQ+TD+GwaaLdk
	EIfRKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mgj2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 20:04:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384cb1637c2so1204999a91.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784059452; x=1784664252; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmV5ef/knQFkdr12gu8Zgwokga2tkN1Tq7U1CYJS+IE=;
        b=PjwKQB8nXk7p09sO1y7lzp9zpA6FabjSrr2G5CkoBn0ulI3TDhvzIGe/VSNo0hkumJ
         9sCBpFVEX0DgsCo5fdV+pryCeWzS/+rTdtL/sCJZYfZG8jNpHpS7K+MHXddBJvVcgoxZ
         j4crosXERM41zl9WGBwlnSEgrQGAlO46cVcN/sfx5nRnS1PKDcTfw4Fy2MELEQt5hrCf
         WyYQkPAjVSaxRgKzTjCP5g4avr8vA2I4AqcDZwRsMWQna1USuoKpcDfh75OxMMbS9QSR
         t8zPJAD+5C+aYMpdy8xVHhnO5CgoMmc62WO3nm66zYhk4F0Y121FmjanNpHSqrMNwPOn
         qlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059452; x=1784664252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KmV5ef/knQFkdr12gu8Zgwokga2tkN1Tq7U1CYJS+IE=;
        b=d27M+5VA02sBMnyqnHELs3mV3ZYbPLqbGBO3BHEGamVuT69w6E18e7qmWjbi9H2cDu
         UAS/73/mertbv22x6rmcxCn0HTRLI6sdJnrXY6+87DX+tgpRfqQYI8cA5+CeeZ98/oJc
         xcN2ZUHV7DDFaF5dlB05+An9MOI46ImSBPU9nyN8hHPjLmknKJPtXeVoECgfAA/HgnSU
         J38Q3+fDWm45WTFbnrWtBDFL3F5cKalgsf/+fT/CawhpIPHgF3A/ZAfTQvhyyxC0AMwR
         IqGRyG+4Qvwx6QNdAuf6noHfEFciEqt1PfCNk/VL8m+I59dJCm5ltM5PzJwS1ye98Tr0
         tvYA==
X-Gm-Message-State: AOJu0Yy8BXKtXQ4CVzM4S7YNI7PBvRGUhySMfA4OMDHbTW+CeqO7zehv
	itG5Rclh4KoSBKeQgCST3Ldd3IsEnJ5i/MmJHQaZ1sXGnPn7GdHvA3QxVVODByTJf8DoWgJ9FZs
	XA1uvsM8stncCZwjS+GTEG0wrVOWAa2Kxt5EGJzrsVIgN/ADhxdPHRFRaVeGIt1w5m8wSWR7sim
	+AQAA=
X-Gm-Gg: AfdE7cljMPP+iHisKKV1VQlNTXWOiBxZpU1BGz3+UtBaTNEq8wYAznFrOzqRA+P+Dbp
	iZc7l9Nu1xO+wqniVj7ZU4P/X1oN1i+2o47Z6iyHrpd15NS4mNArWHK3o/OMs5HM3DTJvMDxXcz
	1b/IO6snwOZeEOsHs+rkXpLys1Ahejz1AxL6kE+fMn6iougxxXOlvK8eZpGgfDfjszpzY9Ms5Fd
	Vx5NSRo0mojkv1zaKj0UyBuRzIjDrPhuq7A6BQmGmNh4VTV6hrTDX2h9PLisAZy1qcgsaeDmiAu
	OT+6sSpF+4AtRbUQRNwhA4o455Nmf4lePcGRW6syze8bI0VC4SlBju8arAk0Aod3uvkFFXlCajH
	5zBeE90ksfnlHBqmFHybcO2BRgZiRxfD8AuMhDTb10Wi+1QsdvKhJ0lCM2w7zdDUh8dpuPnmBEy
	xEOizfvZZIm1LH58hfhotTUEUR8dkX164=
X-Received: by 2002:a17:90b:564c:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38dc760604fmr10710035a91.0.1784059452225;
        Tue, 14 Jul 2026 13:04:12 -0700 (PDT)
X-Received: by 2002:a17:90b:564c:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38dc760604fmr10710006a91.0.1784059451682;
        Tue, 14 Jul 2026 13:04:11 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm56923908eec.12.2026.07.14.13.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:04:11 -0700 (PDT)
Date: Wed, 15 Jul 2026 01:34:07 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: lt9611uxc: support displays with up to 4
 EDID blocks
Message-ID: <alaWN2sI7jzLhJkc@hu-vishsain-blr.qualcomm.com>
References: <20260624-lt9611usc_edid34_misc_next-v2-1-24ce3f5770b8@oss.qualcomm.com>
 <20260624085333.BB0FC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624085333.BB0FC1F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDIwNyBTYWx0ZWRfXyOrT39RBTFwv
 Tdo2rZHMg9XXMGp+srxYw1oT5xRM1/t4j0XLM08e9XInkDrl7clDw+CMOGWnUiZpafcduPJgJlG
 KG2hL0vPrFGk/+A7UZFQEuYWeN8ulG2VPe31fGE3CXLlEwakSYNkBAzOTH4bRITxASZmVb5g7jp
 1jm6aE5s86ZOlYbCsvUQjGQ8GR9F48jR4Fvdr7hCs2qysTEh2Mcm6owL4/sXRLGx6tLLYwQI8GW
 d/AOTfx7pt8J12XxG3U5NeiWAzd5P7p3kS1KHAapbmPUtAEKjmuyJuqc0rBsEytNmWkOmH/s9px
 PmLNJctCLxap2q/AYctwlTNKyMvqMnf3Fp1TTAhf/TQZsRs5sueK9G9n+JFvMUCst+WPxKb92GA
 XPj5gOl2HDgCyThciz7ng8DK7V7uYM2oPsWoujK8qoKO+aIJmVHLObyEIOr6a3XnAIdDvqyJ9ZC
 9S757xT0gvN8GZVSpow==
X-Proofpoint-ORIG-GUID: 9lx9c3od0DMPsdhpmRZ4qnBt1GWF27uM
X-Proofpoint-GUID: 9lx9c3od0DMPsdhpmRZ4qnBt1GWF27uM
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a56963d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SBbTKHRVX-ct9M9iAtcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDIwNyBTYWx0ZWRfX+ixRpI3Ee4gb
 Ta3HRMRnaxhzB/zQaTxESzmN0L9c7JSg7MEayCStbMhSdr2JlnqR87YWWKsaB8wLJYgyMOBwxy4
 zdYq9lk/U0rWfQA9wcl3+gZ5C9gnmdA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140207

On Wed, Jun 24, 2026 at 08:53:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Clearing the 0xb028 EDID bank register to 0x00 after reading blocks 1 or 3 prevents DRM core retries from succeeding.
No, this is expected behaviour for bridge to read correct edid for block0, 1 and block2, 3. after reading block1 bridge will fetch edid for block2, 3 similarly after reading block3 bridge will fetch edid for block0, 1.

> - [High] Race condition between lt9611uxc_hpd_work and the IRQ handler can corrupt the edid_read state, leading to permanent EDID read timeouts.
yes, will add edid_read state change inside mutex lock in v3.

> - [Medium] lt9611uxc_get_edid_block() silently returns success (0) when the EDID polling loop times out, feeding incorrect data to the DRM core and amplifying retry delays.
Correct, Will return -ETIMEDOUT (or similar) when retry_cnt is exhausted without a match in v3.

> - [Medium] Polling the EDID data buffer directly for a header match races with the MCU's internal memory writes, risking torn reads.

This is a fair concern in principle, but there's no separate transfer complete status bit exposed to us and is the reason for
the retry loop in the first place.

> - [Low] Unconditional memcmp of 8 bytes may read past the end of buf if a caller provides a short buffer.
Not currently reachable drm_edid.c always calls with len == EDID_LENGTH.

> 
> commit f8ef2cd8a0639401cecc3757e315eeb45035f222
> Author: Ravi Agola <raviagol@qti.qualcomm.com>
> 
> drm/bridge: lt9611uxc: support displays with up to 4 EDID blocks
> 
> The LT9611UXC bridge can fetch only 2 EDID blocks at a time, which
> previously limited EDID reading to 2 blocks and prevented support
> for displays exposing more than 2 EDID blocks. Add driver support to fetch
> up to 4 EDID blocks by re-triggering EDID access.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> 
> [ ... ]
> 
> > @@ -170,6 +170,9 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
> >  	connected = lt9611uxc->hdmi_connected;
> >  	mutex_unlock(&lt9611uxc->ocm_lock);
> >  
> > +	if (!connected)
> > +		lt9611uxc->edid_read = false;
> > +
> >  	drm_bridge_hpd_notify(&lt9611uxc->bridge,
> >  			      connected ?
> 
> [Severity: High]
> Could this create a race condition with the IRQ handler?
> 
> If an HPD connect interrupt fires right after ocm_lock is dropped, the IRQ
> handler could set both hdmi_connected and edid_read to true and queue a new
> work.
> 
> When this thread resumes, it will evaluate the stale connected variable
> (false) and overwrite edid_read back to false.
> 
> When the new work thread runs, it sees connected == true and skips updating
> edid_read, potentially causing lt9611uxc_wait_for_edid() to permanently
> time out.

Yes, `edid_read = false` in lt9611uxc_hpd_work() is written after ocm_lock is dropped,
so it's not actually protected by the lock that the IRQ handler uses when setting edid_read = true.
Will move that assignment inside the ocm_lock section in v3.

> [ ... ]
> 
> > @@ -395,20 +423,44 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
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
> [Severity: Low]
> Is it possible for len to be less than 8 here? If a caller provides a short
> buffer, this memcmp could read past the end of buf.
Not currently reachable drm_edid.c always calls with len == EDID_LENGTH.
 
> [Severity: Medium]
> Does polling the I2C SRAM buffer directly for a header match risk a torn
> read?
> 
> Since the MCU writes to this SRAM sequentially from the slow DDC bus, the CPU
> might see the first 8 bytes match and immediately break the loop, while the
> MCU is still writing the remaining 120 bytes.
> 
> Could this cause a mix of old and new data to be read, leading to EDID
> checksum failures?
No, this is a fair concern in principle, but there's no separate transfer complete status bit exposed to us and is the reason for the retry loop in the first place. we haven't seen any failures during testing.

> > +			if ((block == 0 && header_matched) ||
> > +			    (block == 2 && !header_matched))
> > +				break;
> > +
> > +		} while (retry_cnt-- > 0);
> 
> [Severity: Medium]
> If this retry loop times out (retry_cnt drops below 0), will it incorrectly
> return success?
> 
> Since lt9611uxc_read_edid_block() sets ret to 0 upon completing the I2C
> read (even if it's the wrong block), ret remains 0.
> 
> This could cause the DRM core to process garbage data, fail validation, and
> repeatedly retry, multiplying the delay. Should this return an error code like
> -ETIMEDOUT when exhausted?

Yes. `ret` retains the value from the last (technically
successful) I2C read even if header_matched never turns out right,
so an exhausted retry loop reports success with wrong content. Will
return -ETIMEDOUT (or similar) when retry_cnt is exhausted without a
match in v3.
 
> > +	} else {
> > +		ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
> > +
> > +		lt9611uxc_lock(lt9611uxc);
> > +		regmap_write(lt9611uxc->regmap, 0xb028, 0x00);
> > +		lt9611uxc_unlock(lt9611uxc);
> > +	}
> 
> [Severity: High]
> Will clearing the 0xb028 register to 0x00 break DRM core retries for blocks 1
> and 3?
No, 0xb028 register is cleard as per bridge requirement for block1 and block3, as after block1 it will fetch edid for block 2 and 3 and after block 3 bridge will fetch edid for block 0 and block1. reties are required for block0 and block2 to make sure edid is fetch correctly.
> If the DRM core encounters a checksum error and retries the read, it will
> enter this else branch again.
> 
> But since the register was already cleared to 0x00, won't the retry
> consistently read invalid data and fail?
>
This is fine, it will return ret accordingly. register 0xb028 is set as per bridge requirement. 
> > +
> > +	return ret;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260624-lt9611usc_edid34_misc_next-v2-1-24ce3f5770b8@oss.qualcomm.com?part=1
