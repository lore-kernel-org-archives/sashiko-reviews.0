Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B940BCD0
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010523; cv=pass; b=empFOQNW4EHgC/OvLsdlWakAzl7zH30h0zUtqQypLx6gBbFLf+hQ/KHTkayTryM1KKtVtFTUi/fmyNcvGyKNbbAsFiqbxJ4M63CzerFcSN2/PDPrlA7yd1s3jn32kkvTbIxIhlUVKkA83HflJJsF96/iWLOl2XMTkuZTBstWHPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010523; c=relaxed/simple;
	bh=p1w4dDG43UhRDLwUBFWbpr/Q0ulJgmdjjjGOiAAhk8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arTxzpbNYmlT4Ds/bzKpPX132hBVvtNlFH7OXLqZv7/hSMw+5I2Y4qsenty6zUlRsc//3C5//Fb9KghHsbnyhH6Oh9n+qscPon52k3gzz9xzCjadh5pfWi59fxCcUpWErGG2ts2Wjc5TB7dTRMKjTVoS36zaf9wy0klJ+SYc27o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGPLrxMr; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGPLrxMr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec449d0af2so635149666b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 06:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781010521; cv=none;
        d=google.com; s=arc-20240605;
        b=P4+TO8ahdJaNOq3hoNsyMkS9MT0ydiUSibdjanZmpYzOPNWeE4g0zpKPxKoW9P/lhj
         fNCEoKe8d0D4awI9X4lF+BLJYfBPE6sxF2ERqOXK9QKArOGy7ZwRuEcKF3vCVajRWWke
         ChYUVz3GpZA4B8hhmYTAJ4PsorpR6elc4ESntLY1bRrhnwEwkMHqbusfnwdmhuP5YVuV
         hyMYsgjsyJ+xY8EG39aMU/WNLGaV2kqdBsAMnRPC9W49ogLugbZPK79xYxVbHWm7RRPE
         H5SaXAuLnRAkVYrKDYaFjM1bnD9oIJOZyTY33ZH7HiTScQVlFuaHkF7gCbNwkg2L0N+x
         CerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p1w4dDG43UhRDLwUBFWbpr/Q0ulJgmdjjjGOiAAhk8Y=;
        fh=U7/jdAgfLOojPauQEifSq9rl8JaQF9bA8n7pmYZ3YKk=;
        b=VeCOu5bl119K88K+bC+OhRhvQOwc4PlhJVYUv0wJRBAe4Uc/APt8porpylK3TuJaEs
         9irTL6G2QIpSPLOmhds9xMCLoYHsACi8xU/i8teLzotx5U2EeP3aODM99pOrBidXMndq
         H+w+yK2cp8AWCnCE4LarSVV5ydbOkE1IxEXUZdPkvSxmUrWL6RcTxzWQRT2vW2tUE+Kf
         KD1yHjhm/p78cmj4rCa2rRx0qOh8IhxKhd8YGMjn7oe/syDXE6zK2dx17ac3qTLNk4Xf
         DsH5uIOXcvhs5BRwE1yhBGLnpICIE5CZpUxw+quBDSzgDT9tABQUqgMRcRswe3XtA7EF
         RrmQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010521; x=1781615321; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p1w4dDG43UhRDLwUBFWbpr/Q0ulJgmdjjjGOiAAhk8Y=;
        b=jGPLrxMr4z3Qj0eiNGX0OulTe5NqRvT6tfC++vBP3fFUV1/yDP184bLRDO8UnlD4Pc
         Wx9/eWE8rxifliQb1zg/Q8etXfvASpGKHmrMWE8p6uoC7FF6bDMleAA2wEOFzS5mPvDB
         sD9bA2z1FksuBCgrak5I2NOJxyT0ZsZ9rxSxFqWLTkWE4kUirzNzbPguy/k5DV/2R7nl
         Yy/B8gvPm+f51K2l5gBgRtgEzjTBQo5NbmFPc1ZLhd4wSwnFs/WorsGSTa/Gi1FugUx+
         qQueCaR231ZQ/NfC+Kwumr4QgJShTqLSfVsw3kEkHAHoAiPHmu/S6BRPZY63HQP3GcQ5
         n1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010521; x=1781615321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1w4dDG43UhRDLwUBFWbpr/Q0ulJgmdjjjGOiAAhk8Y=;
        b=edhhMbMZlj3sADasZe1OQAyQpDh6wo8XqoII96eOmdezn0sRQTc/ToYwfq9a3H3r/x
         FKYA8TaI+Bd+id9Nwz9VyziQxh1fb8AmPY8EtC6v9bnbicj3v4OE0dUxicvI977HZi+M
         w606/HxS7+K5RiAOHjAEqSWLjhdBOYEqr2ndiKmEiYU7NAWRksp7YPh8rhQk7kn+1EGR
         e9qt8nBGexmLSsM2u7R92GFXz7af0bHqR1Qtd4sZery1wpxWLaboLFx6Y7ko40VL36cf
         s7Zuo8YipheGtSFJhs0ULebVnbg9EG1h59YQ0KxB6x8uOJ8f/aCi7ZpyRmApzHJCVvYQ
         rDHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/esXaASPd/yzWs5Z8nP4FRuyAI+pbJnOiIgy0arE1Cd5MUk+7l0EZbnUyc8CHcAZaYoGDNXhPnDSkdD+vwSxI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwArKNQaBr/tBG0jlo0HqsKUHr+kXQyXPBVFZSBwSr9+W3OVT/n
	sLnXIisAchH9hjMfiGpvMxuG5z/Vn5RkjdRVicn+bl+oQLSYUzpR9mtRD2oVydIydUl4GCQAUJN
	lX9EBlHsFTbtx/yViBnhGL791VyP091QthpGZm0odWA==
X-Gm-Gg: Acq92OEBhUMG0EomC0zQ5xrWv2KubX3qSCVWvi88YhmtlzBA387sAOo4VqUBiawv665
	dYtLT3jPwHtbl0Pmmgzb7SBhGIGee/6NRQhAoA+C7NLpTcSkLmeA8R0olZsPSpxndXMg0TVL1k/
	E3+ZDXKFlbJB/sSMqPNmQA9J2zL1yXiaH8GVLpOxzuuAiM+SBbdz+Prj+wfGxH9+A0kpXPT7X59
	3XDVF+VRPEFlhsIv/wWH3yAUPp77dlC3lF0CGqCyfLlojDxyPQ32CaHrqyC/lLqore3UN0IMbh7
	VaQTWfMrjguIv23PKR4V3B9CN/WXXhILBHChQjffOH8kw3mG9A==
X-Received: by 2002:a17:907:3f07:b0:bdc:ac75:73b9 with SMTP id
 a640c23a62f3a-bf373a032a0mr1102504066b.43.1781010520517; Tue, 09 Jun 2026
 06:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609062005.1702-1-aditya.ansh182@gmail.com> <o3k4wongcbuacu4rjsb7h2utzsrhpnun55vzdnp46imnlbn5x6@matvyu6j2xhc>
In-Reply-To: <o3k4wongcbuacu4rjsb7h2utzsrhpnun55vzdnp46imnlbn5x6@matvyu6j2xhc>
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Date: Tue, 9 Jun 2026 18:38:27 +0530
X-Gm-Features: AVVi8CfZC1RqwwBADreq6qsprBnJ703dxJwRvA8K-MP701ezqTH9LpeReoFjIWQ
Message-ID: <CAK5ssPPArwEQyU1+icZXJMrd2zmkJwzOSov-0iQ+TVRpU-g9yw@mail.gmail.com>
Subject: Re: [PATCH v4] ext4: fix kernel BUG in ext4_write_inline_data_end
To: Jan Kara <jack@suse.cz>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, 
	sashiko-reviews@lists.linux.dev, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+0c89d865531d053abb2d@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

Thank you very much for the incredibly detailed review and the design
insights!

I completely agree with your suggestion. Rushing too many fixes for
complex, concurrent race conditions into a single patch makes the
code harder to review and risks introducing subtle regressions.

Let's go ahead with the simple and straightforward v1 patch (which
has your Reviewed-by) to fix the original syzbot crash for now.

I will take your excellent suggestion to use fsdata for state
communication between write_begin and write_end, and I will work on
formulating a separate, cleaner patch series in the future to
address the remaining concurrent locking races you mentioned.

I will withdraw this v4 thread for now.

Thanks again for your guidance!

Best regards,
Aditya Prakash Srivastava
