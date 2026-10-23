Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772673;
	b=nFqOTuGPjTpT6amQEtREQyw0YXBvcRCaeB3DZkUePBCk1z0UnbC90Q9xXm2EyzUKT9y2
	 +Zj2b1gl6wGHC1iFvDkjm8bDIzskvioitwaxFTmvvVRWF6ZoC+Ju2NifiOKaRnb476//n
	 LNGhSAhu7GlILP/iXO10bKNi0QYoMMMvKhrFHrUSLomhw164C082o31aob53Rx5rRu3yF
	 VWZsKcyvctskhpYJ/v7WczQ1RKJEhCYwtn/n/mlo2zO0HEE1ogRfqh5d4XmmibMSWQ6yv
	 9a/Lkg1kidTNdu5n7yIPoA3Ia1FRmtUH6KSqR0ZB3VrvAnM7FxkOGFDgmYcFrcjrgsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=ZVDqySEJ1BASNoDXFiyXutIunci5PTUDtCHQjzccD2o=;
	b=j0QGdp0xBuFqCD4wMXq9pzGc3p0sunRSXSOY298+HUzcRvEFkV0+ksORZ+O4RSnD0KRJ
	 6KdBmdYNo5pWMSO46SyJ6ImekC2kmdmaRQt6aA9tSIZ1U9YdErAOzPt/YKTdxwLAAC2uJ
	 cSmMAnBPBLWTeX0MTq2ErlY4s6YLU5YV6FyBPpnUUqbFM8lib6ecyuR6C9ci6wbpiHJSe
	 cF+gE8eQfzYF0Ea/LibBc1HhyMxmrzQKG+c0PEZha8BVh2hA5AlqkRq7d/F+mtD1HzNGm
	 XpAYT+m6OxqOTAS7O5ocEvnyw+Wd5wrkwix2xdCvsxSxleq0nQDS16yJgkyUHecTBhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CW1cySxD;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC57606A31B
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 16:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC57606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CW1cySxD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so1687019eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772672; x=1793377472; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVDqySEJ1BASNoDXFiyXutIunci5PTUDtCHQjzccD2o=;
        b=CW1cySxD38wXxTHk3UEJmQczfUkftOYWb2jcKmeirIVhZciKEKbBSIKfR2EjkzI/cb
         aSHCbbzd5CIPOr+FfLzVDiWKBDNGnpJu64+5tLA60q02M7K1Fc144PjrRyimQosUTX27
         4HotrubVQGYT5Gq+TI2D6X5R7IbJLPYvFzuyWy3Wv0u6IYMh4kaIlV5R0hrUkPy+z6vU
         8pcUvxdk8ldC4l02LAFoc935JTOJhmrCaCu5+o603inK9s6ti2Nzml0x8ejV4zGL2DOi
         tkMpwVpueuBAT/7nDJyuz6YaKFen2mNR6j2jVeS0W/SIsV4wLSABVmNzjCHnLI1HjxNJ
         +PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772672; x=1793377472;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVDqySEJ1BASNoDXFiyXutIunci5PTUDtCHQjzccD2o=;
        b=QqOe28jmUCjAOBlby34VgBuNx+UcT+pZNIAF3Re8t7cKzMXlNzVrtMumYYU5XCl+Zb
         GsbTspNi5hT3itvVXG/AiKYmyBUlFAsfI7abYg6eU6k5cu0kK8+yTew4dQFt1M51hMK8
         7hIfCKMrVx78lF3saheIuQqbPDGRMdjh4gtOH619f6P0Kbzm44zfsBcGjbOKYHfAK/sa
         uHpXcMs5n4ScoGxSy6uj3HsxnCcZpz+1LokhZm4n6vcuVOl8x81ZlRJiONgV6rFWjiKE
         KC+RXEFCDJcVGnIsiI/le/bMaH8IfDMY1Znz14bk9ZRHLJRIMZf4XCk4dprsnVLJ2svx
         UdKw==
X-Gm-Message-State: AFq9FYKGqi+G0R2RmqNo1GvFXRBPOdhq9BQ5HFexa9s7ldB2Ybo+oeBg
	w0f6agbORdjpDtQvLPHWaVWiBPfncCDjyru/GPfo6UqJgDKWOXba5iyH
X-Gm-Gg: AYBFou0A+PXYKbInaP/JRHExTYunvfMlYzKlshvgAi3fYSurD4avQft6rIx1SSVldSw
	CGh7mBpOkMMnNnesYy5H6vGi3GHOhcl8mCT2YOzdNJABZs50L8tyFge/sK4n0Hg5uhLgGaEL6kI
	3yt/Y84w7fhFacFZDrUMpYWP3ff45CrVhJBY717e1XT+pzbC48yYgLKz7XMC4YMRWQiyz1BEvDW
	SVvGb1sUQy5E+WqfEkE/+SZEL1dOGdGEf/eKyNbaohJPl0MwIMt89Pa1bUijbF5RF+R2bblpugP
	FoGT3411SeF1I2VXQSMxiD3ioFi9BzE9BnPiaz+Blwvonj7pX4TPYUf7SvR7Fiu8mRwdG1AEYkw
	BJplk4qHK4fTSerbl9Bf4W1XXln7JCbbSOeJOmihNOkwnnABC3zy8w/o0rYl5FgMjiQLYIZ2sqG
	dYCcL/z9uj8W/PD8eILI/FEyWGVLokmco63cCXjPn6k8i0FkW1d1s1bf/x/msLCYqURapsHxKmo
	WSKGXRO6d61nmgiROYCEczSl+341Dzo8LccX6cH1kp8w4g58fk80SFJWJd2VnTlZucgrVBEDg==
X-Received: by 2002:a05:7301:db82:b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-369d98a64dcmr3384611eec.37.1792772671945;
        Fri, 23 Oct 2026 09:24:31 -0700 (PDT)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6ec2d97sm631905eec.24.2026.10.23.09.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:24:30 -0700 (PDT)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org
Cc: sashiko-reviews@lists.linux.dev, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH] perf evsel: Skip group members without fds when walking a group
Date: Fri, 23 Oct 2026 16:24:28 +0000
Message-ID: <179277266830.1885600.10381796857085073613@gmail.com>
In-Reply-To: <sashiko-outbox-182570@kernel.org>
References: <20261023085629.1694941-1-takano32@gmail.com> <sashiko-outbox-182570@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Thanks for the review.  The members are not unusable because of the
descriptor that get_group_fd() forwards; they fail to open for their own
reason, and the crash is in the enable path that walks them afterwards.

Instrumenting both steps:

  $ perf stat -a -e '{user_time,cycles}' -- sleep 0.05
  get_group_fd cycles:u   leader=user_time leader_fd=0x...  (the /proc fd)
  member cycles:u fd=(nil) supported=0

The leader is a userspace PMU event, so it opens without
perf_event_open().  The member does not open (on this box a system-wide
run is refused by perf_event_paranoid; on a permissive host it is the
EINVAL from the group descriptor), and either way it is marked
unsupported with core.fd released.

Returning -1 from get_group_fd() for a userspace PMU leader does not
change that outcome:

  with get_group_fd() returning -1 when the leader is a userspace PMU:
  $ perf stat -a -e '{user_time,cycles}' -- sleep 0.05
  Segmentation fault

What crashes is the enable path: evlist__enable() ->
evsel__enable_cpu() walks the members of the group and calls
perf_evsel__enable_cpu() on the member that never opened.  Skipping the
members without a descriptor, which is what this patch does in the four
loops, is what stops it:

  with this patch:
  $ perf stat -a -e '{user_time,cycles}' -- sleep 0.05
  rc=0  (cycles:u is printed as <not supported>)
  $ perf stat -a -e '{user_time,system_time}' -- sleep 0.05
  rc=0

So get_group_fd() is not the cause here.  Making the group descriptor
valid for such a leader would still leave the enable and disable paths
dereferencing a member that failed to open, so those loops have to
tolerate it regardless.

