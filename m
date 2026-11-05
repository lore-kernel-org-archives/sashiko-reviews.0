Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885873;
	b=AfshyGEw37/dt8cCbTqMoaJadDnF2MOy1yktQmgzi6mjhO5OMYgSaJIkpvR33PT7gvyy
	 6fuWsqIqQx7fr24SKe3umVOOVfEkej0hugLoU1XrI96ywOf+CUg1EnOzgOKPmU5mbzvYb
	 Zk1JgszjHkRVVOihmpeD7mLHfHdtOrEaOo+AojcV7FO6W6MdygR6GfpunSTCDGGY7g+qv
	 szcZD+yS0aVrw0qS/RaT453cQ1W69JEOU5Gkisq+6QdZkBUVBVDswliBM4jad6+CJVjMk
	 KOs56MsdxY1LYxuKBwn9LAwBoJmwO2JT2W665QQAGv9achwt1dizJQ/GKwvMATeubwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885873;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=YNS6rAKby8LR/Cbc4BYoT1/kR2X+t0J+rzMsMWD0wNU=;
	b=p0aeO1yvVI+QIA11vHtmXwdjPgpgx4QjSR/0XPxijLXxUWguw1UAW8MYdhTIsQdLGvpq
	 nVvxkLpAEUdW6p4oOIhi9YSWcX5T3RtY60wElVgo1MArZ1EhLbnG0RgSx8OM5YsDl5p+/
	 OKjex7XCH4coGzeqmNj5ttDeBhrlnz/IBp1MPoAGand5rX46woiMHrYtHkeAMdloJhzpb
	 iqVBbau/7iBHNOq2LS1PQk7S4iZ128u4h+dUwNnZP79d+o3q3zOqlDMTRj9734+0qsT/g
	 R9mf4z+8DOdAsuBTOhZlUi+zCnM0Or0FTtRiV+r2pahlGOmCz13ZwDTGL90wHyqY9fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A6oMGa2H;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D27606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 13:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D27606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A6oMGa2H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793885871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNS6rAKby8LR/Cbc4BYoT1/kR2X+t0J+rzMsMWD0wNU=;
	b=A6oMGa2HMFBtcTyB56Rh00KW5mvLpPm1iGyZl4Q4Ls9WLwi/OIfX4orka7CA5Ma4e/Lqaj
	NsxlX12fZvOeXPJyFwGQAYQ37hUQJbihjhRm1cUDGSN4w5VPMghEe0T/Udmsjme8SKaqYQ
	MJSeTArUVlhKHOaho0nak6y7c5GT9Xs=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-W4NMH7k1M-SF0h4Go25f4g-1; Thu, 05 Nov 2026 08:37:50 -0500
X-MC-Unique: W4NMH7k1M-SF0h4Go25f4g-1
X-Mimecast-MFC-AGG-ID: W4NMH7k1M-SF0h4Go25f4g_1793885870
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6f8edf0c859so846037eaf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 05:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885869; x=1794490669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YNS6rAKby8LR/Cbc4BYoT1/kR2X+t0J+rzMsMWD0wNU=;
        b=o+Dmjz22sRFEEytUuTZZPcKDlMbStnErkCgg9M89CvO21GlyEJDxnQpx1tZuqnKdxh
         g5/HCjyRzydLwb7hnkahidMQIaPup1KPt4T+f5Ms32CFIefSpdABbEeV6P1D4PVRt+NC
         E5jRVCMh7M6qSxJhC6c6moTlCXvoNJw/z2fELscb69cZXIVebNFxJfxzAWWjmr5c9WoM
         cs1rgaoXANHfqKOk0PNR4BWuvAnF7JamoGtmDrraOaPXeImcCeMJMZpFQxBEpxojMkdV
         mHSxjmUB5+vnG/UaMoagYj7XiJ3unVVQMKICcTwUkdNsf7jAPbeS9hVrwpkv5sPZJ6aT
         KAyw==
X-Gm-Message-State: APuU4Z8D7uoW2bHrN6Ec/rXVkI7hiGBiZ8iUw1eZqp3FsyIGENkmm+b/
	AYzLUxIY91qzJk6xhdlcwqfIueFhqbf2bHwai+qH7bL/pUMRmBeNtxj7QGAEITfzVoB6cOZksrm
	ojYuBcVrOXqeP/1vfoNkOSSoW2/hfk03mpOL1YtNiZogoxQpKfqhoRJyZ4EHSH4O2D7eoYh5inQ
	SHFQ1mwLfA+RBoAuXV3WUcH7DdQWS9B6eS0dNcWGFmoSF46E7nF8pleQo=
X-Gm-Gg: AYBFou2tMzuc0eQZ7W/4/WKB8XrpQ8+8z4K/wVCq98c+02K1iZ6MNHExbbHVQlbDIVi
	PvOtXViA+tBmGrZZSqUDfFjSRNq1naQTSQ1bxxOqyOw2fWpp0PCvGKcLRQT9iCBXV51O8I1rQ0b
	LZG9s8pi6pAYFHxyjQI2J0YVEZ33Cy4dVlRiJmLJYqHqTeHvekIfED9JeZkNMo/ey3tb1xiM2OO
	GEty+/jybzKNCKXrBBaPuxRFuvudnfkZahdituME2N4ZB/FQjSeq6tjHjR9NomRQbnYKv4aBI/i
	NAqjgSxeogQ5C+uKdzjFLmynUajtcgbVZMomSt1IpX5wWciuvx9mGRFpWOg5yiHzsGaw44LcHDj
	1B6lELS+wYwTsc9HYwAjsmyHxb7jdVB845Tob1YnH2oLkKv+vJZhW/0clwMGE87XYmSL9A9CVPh
	1KtYtzD+aBtMrx3Y0p5GOqtkpgGQFyJFY/nCVlNg==
X-Received: by 2002:a05:6820:60a:b0:716:c870:7eb9 with SMTP id 006d021491bc7-716d1ed0d87mr1387482eaf.17.1793885869579;
        Thu, 05 Nov 2026 05:37:49 -0800 (PST)
X-Received: by 2002:a05:6820:60a:b0:716:c870:7eb9 with SMTP id 006d021491bc7-716d1ed0d87mr1387460eaf.17.1793885869035;
        Thu, 05 Nov 2026 05:37:49 -0800 (PST)
Received: from mgandhi-thinkpadp16vgen1.punetw6.csb ([2401:4900:88fb:e4bc:f699:bfa1:8ae:63f7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12b7d84sm4066366eaf.7.2026.11.05.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:37:47 -0800 (PST)
Date: Thu, 5 Nov 2026 19:07:42 +0530
From: "Milan P. Gandhi" <mgandhi@redhat.com>
To: sashiko-reviews@lists.linux.dev, sathya.prakash@broadcom.com,
	kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
	sreekanth.reddy@broadcom.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2] scsi: mpi3mr: Validate reply frame size bounds
Message-ID: <auyGpgpDR_SJ_7UM@mgandhi-thinkpadp16vgen1.punetw6.csb>
References: <20261103123316.223917-1-mgandhi@redhat.com>
 <20261105122401.266559-1-mgandhi@redhat.com>
 <sashiko-outbox-199052@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-199052@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qj7TZJ3hyk6_x9mGhgLdKALpz6BD2sTuRUGxtS1j6AA_1793885870
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 12:45:39PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Is a minimum of 16 dwords (64 bytes) for MPI3MR_MIN_REPLY_FRAME_SZ_DWORDS
> sufficient for event notification replies that carry struct
> mpi3_device_page0?

The intent of this patch is specifically to establish baseline firmware 
interface sanity in mpi3mr_issue_iocfacts()—preventing the integer overflow 
on reply_sz, accommodating standard fixed reply frames, and avoiding 
underflows in logdata sizing calculations.

Event notification payload validation touches a broader set of event types 
and handling paths, which would expand the scope of this targeted fix. 
That can be addressed in a separate follow-up patch.

Thanks,
Milan

