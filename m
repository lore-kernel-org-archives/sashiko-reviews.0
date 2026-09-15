Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987333C73E1
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476551; cv=none; b=PKSHa1FHgVPK6Rwtr7KgGTSYxzPYXQQLXwp/wLBdrjv9Q7oM/8UI6dG85kdgm+RQXMd3Sl4jTp3/SgCshy+HYhuNZBir2a9MIPmtD1HdqFx4LBGd776VDPJ1jlQU3CdKZa3S5plFURbh/dp0fq14XIBo5cEMOXMI5JnQ9+xFAB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476551; c=relaxed/simple;
	bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WcNoa9KM6g7LatwdcE19KYoets1XC0e2P07EkHMKDm9r9jUKB0J1MDxSp+aPV6og3RBiDfdFQkWUCNZ0KpdiHAQs7gAeioipeGRiJnijd/A0ce4ZArF0it7bFwERd5XbK11IO0rBPWLzETjRW4LRda154YR0llxpMQp4LVlaRCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPN5mbyn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPN5mbyn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so21555435ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476550; x=1790081350; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
        b=hPN5mbynZQl7E/kktKVvK4SC/DHeS/vJ6nbD5w0txkvRfialMRu5yn9OhSjZwyoDKJ
         9vNaEfEBmwVK/gv8+qk+HahKCtauVlUEp6Eqn2X17hN5ZR4NhDE4x+W/24XGBatMRogo
         KvQnWDTESJ952LpPtgIgzkH16V3bgxtaXLdZW6xAYiuPn6bSH+eXv9v7NpDQ7zxkWATB
         7+7Mvwg6+lsa8ZkeRHmWoXQiz6GUZZAzydRjVsy7DZs6roMEMH7wielvAtE76HKTi27p
         mEEWzgPGW7JzGS3u4D1D719bzrEZ8f3wE7wXXPNMpFf9LMJjxr4RS7BPbOM5RiNNYs/P
         vqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476550; x=1790081350;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjF5uq4+rnXMZsq4PdMN+lhsdpK+neGjIFKdjIdf+8w=;
        b=FrXbPF3gKWW4ZBiSBTABYBKhBWnayptoSvbqfgMfY97Ym+7uGnHhIY7aDdA+3tcMjw
         HVvPEFxBURygJfHHA/MvEm3Q5qEmw7WZFvm7+yEvczL9hubpzvzZ/j9UiUUTRXDdigvA
         i+oNnumNXJWg51U3BdMK6sTPzLx58+rk98jJOqyDo+CL7wjgrqErmmVpxKNs1wHYWu5C
         hNlZdWcASz0ABWk7ytiEdCpZRWgiQaHCyVEF+t0uP96J+tCcDhh0jRPwxcfJo5Mbqa99
         1GFVsKrRq3n7AjuyAVuY0f8MiwHY5oL1hYy2VDLtRYBCkek79BLUMsX04/YpjP49TGrP
         8ctw==
X-Forwarded-Encrypted: i=1; AKwUvBxDIkF/iUu7SLctzdP6ZPIFFz4HEQin/0jHVpIwGmt0mhpBFLmDnS5BPGajoKxmegxGaMJUO/V2o2UnsO9pppI=@lists.linux.dev
X-Gm-Message-State: AFuF++n6XuquQRMt7++kqRd3nlkqPBbKstWUSri4TCmAKzytGM/LNFQu
	pE/moaYHIm60+7SKcnQb0FDzW26jZhypfJ7/753WF/xS37wfzhqs6+QF
X-Gm-Gg: AYBFou3cAxEG2IGNZleZInKkzi93UCacA9ZK/kW9oHgi45UHLg0KHVtCrbLwEWWOyPh
	xUFy0sxSFOnV1BwIuWEOWVxnmIWc0noiEi546nwvyMSC/zyH+i6Fvcb8NZ6PQGkZBeAoII0BEeO
	747FhxiN+/2UjsHVyVWqGlvz3sElHiMorifmSFwsrqKPJ6HPPzS0HPipiBfjRMifcX9HskFBczk
	us1PP/LAeR1hugFq8790VgHgd/zw5vl/l/yoqm/kxzpXFcZXmK6JB5OlLcIxKMRbDQWFbLCSXn2
	mtf8ywYOuELzwdXNfyV1G7No/QexSnFCurVP+cpcLYfr65NgM2Rps9PlP+T+V31hzlneBwfzw0X
	FsAebPBn3MEB8r4THzJRlTi0JGHgFrgDDaip4fZ9xD5f+AdktBbbqQz+2qsGdl6ChtRyp46zRd7
	Dn/1RsSiRsuvez7nhggFl4QDikxy3SvH0/Eml50dWu+j2uprBkK726tPzjbdxlaHJQiP7HWw==
X-Received: by 2002:a17:903:320e:b0:2cc:864b:539 with SMTP id d9443c01a7336-2dd6c5eebcfmr170674595ad.6.1789476549474;
        Tue, 15 Sep 2026 05:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd48ae3cacsm52866095ad.26.2026.09.15.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:08 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Tue, 15 Sep 2026 12:49:06 -0000
Message-Id: <202609152112.ReplyLee0910.lhw@gmail.com>
In-Reply-To: <20260910093232.GO2133376@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

Understood, sorry about the threading. v4 goes out as its own thread.

On the three sashiko items: the naming one was a real bug, the LED
names now flatten the sdev colons to dashes
(asus-arion-0-0-0-0:led0), so there is exactly one separator again.
The other two are false positives: kzalloc_obj() has been in
include/linux/slab.h since v7.0, and blk_rq_map_kern() takes four
arguments on current kernels, called exactly this way from
scsi_execute_cmd() in drivers/scsi/scsi_lib.c. Details in the v4
cover letter.
