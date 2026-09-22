Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B3D25B0AA
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046101; cv=none; b=jtpVTsy95Z2oiSavLp6nBrE5szO4SD22j9FyOGoGleFCbGiaO5GuKLFogzWDTZkoiZ7psFXKnPx6XixdYsg/3XKGH6p8Sm50TKhADdtVmQudU/xNIb/n06FDY2g4GSR4uDP3p0NQfsJxHwDoDNWNcKxkXDSiYE0VglRMeNiBKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046101; c=relaxed/simple;
	bh=mrZFcael0i2SHdBnYzZgJ135z3Sm7u+UibmRrm3Y01k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=qcHGw06UOM/92M95nEaPQeRrhHHuTMu1afUNUPnlqiDvrLkdisFCaHBWHCQQwy+2RLHZDIFvFk6B0Lw72JGhhAx8HYF93dBodA05evJFM39lmPlPMXP3hJ73bPfniaq1t+GiulrMoked5K3fEvbcmWcu9sad3fmHnML4IsJoFgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJQFAhcy; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJQFAhcy"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc433d52421so2114605a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 20:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790046100; x=1790650900; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VToeL6vAbXQdg6OORL5InxeCdnH1MZA2FYzoAYymOug=;
        b=GJQFAhcyWKXLkPUIPdaefP0KL5LkvbbyeQ/OiIV+A7B1rGVJP801cUKNIN/hivX8aZ
         7O9ELf5BjTuPy8bGHLKV/TgqXypVgNghqfFaRj95nHwuSYEOw0q9K3gG0LqVf683oE37
         yvzj7C/4R7V7P4IB27ARVoK8byVNZmLUIw1dezprQ2wYDwDToV+X6Y3Iiwxmr5E3/crl
         VBMOcYoSYcsL59rG+T8INVT/4KAxZFkV3tyKo6KwMHPo5mAPbxVt2mBULIQ17lcNxWc1
         54J50zztgRcZ0x+6/bSFhrdW1VlVxZ9qMWzvdyUiYfBUNEht3qQE40QISM0EdpYOKBfB
         L29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790046100; x=1790650900;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VToeL6vAbXQdg6OORL5InxeCdnH1MZA2FYzoAYymOug=;
        b=a6HtfV70FQpHSrVO0amqm/GqDhilNFMUse3yZaM8aVfMxpBHjLwHcbJKXTGXzOya95
         pSIpDAu989bqIZIWZbHdzRUOKXl1JTDAb+92woM5n7uz4WlG0hzgQIhAMtL6ADlEWT9c
         bF7IW1uFEvW17kcSSGa2M/y7kC8tpCqCj3ngzpZD88j/r62tfbDa2wKfXGohYgBh2aXB
         uf0NZZlKAtjlFSrsmstajQFAd5qcD3AozlcNx+5ar/G8CzxXihzLrEbtcOXwv/n6toQT
         QqNEcckQLFF3iOxZmlfYCi4AShqRm4mUbnfzG6gYTvLzLMwnKscuO3Uwhnom1FMyO9jg
         jq3A==
X-Gm-Message-State: AFuF++l516W7aTM+L9q/z8ZErr4DtChe+nyt3PYhIjaiKM7tl4PMtxyb
	HfZkodHIXqWrnDpts4V34RwRKC/2oPfN7cHKqqaj2+0yBQt3kA0TiOV7bUBr9w==
X-Gm-Gg: AYBFou3Navu+4NRyqIghXi8lY+5a0Pbww2WqOpt+1IMr6pGXwRKbP6eGKl6Kmrgrqk3
	6RODsRD1td8x8aD86gvapiT4WZ/wS9/b7qgeqLNCMHi2vKUXBL5Vwg91RxDiNR6wCD2Hk11Bbbp
	qp+mELDSQIeRB53wXhApp2Dd4kAIr0BYFEvtaWph+lCt9DpcWAPfUC11bawGAYieO5i66VpNh39
	aWWwqDPbZC0M/Z4WIAkrpGadtJ11dR1b45Q9J36yrsI92qrFXAMfidw2OqQ+TuMZb1qc6iT2e8M
	i9eo9RuB2tbU7tFbhKVnYjj+ameBq9RDfUyPr4ksDMXOJ6bTtoP484gOUt/mIY2ytVDHwnjqmpw
	Fe1IH/xqYmf/c0NQtcOohbiCxXuAkbsXMFtmw6G+MqAPaXM8TTOSRZXBTygpsXgVBrgSWcsYrBs
	22R7lsHARaGMJvH87TLSIoq2kXAWXhhNVFitq5qPv8iC0EmQjXZyCNULHZcPpxdzy9vgt3ECh75
	faY/Oofr1D8803TtLJpO0tJTjXkbPP9lJSctKQxWVY0VY90fSYVS0CT9PofF8xpLeYhHXRe8Vo4
	pQY=
X-Received: by 2002:a17:90b:2b8c:b0:39e:b7:cbea with SMTP id 98e67ed59e1d1-39e54e3d37fmr17962423a91.18.1790046099700;
        Mon, 21 Sep 2026 20:01:39 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e570d9esm549993a91.10.2026.09.21.20.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 20:01:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 03:01:39 +0000
Message-Id: <DLLIDTH3V5WR.3M19UWMDAHFMQ@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 10/17] bpf: Recognize pointers to functions in
 read-only maps
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
In-Reply-To: <20260922013100.6DF101F000FF@smtp.kernel.org>
References: <20260922011323.1298619-1-alexei.starovoitov@gmail.com> <20260922011323.1298619-11-alexei.starovoitov@gmail.com> <20260922013100.6DF101F000FF@smtp.kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 01:31 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +		/*
>> +		 * The program that didn't load is not a user of the map. libbpf
>> +		 * loads the program again to get the log of the verifier.
>> +		 */
>> +		cmpxchg(&map->user, (unsigned long)aux, 0);
>
> [Severity: Medium]
> Will this properly clear the map's user state if the BPF_MAP_USER_PATCHED
> flag was set before a failure?
>
> If jit_subprogs() sets the BPF_MAP_USER_PATCHED flag, map->user becomes
> me | BPF_MAP_USER_PATCHED. If a failure happens afterward, this cmpxchg()
> strictly expects map->user to equal aux, which will fail to match.
>
> This can leave the map permanently locked in the patched state, causing
> libbpf's subsequent reload attempt (to obtain the verifier log) to fail
> with -EBUSY.

No. Not a bug.

>> +		} else if (verifier_bug_if(ptr->used, env, "function of map '%s' offset %u is removed",
>> +					   ptr->map->name, ptr->map_off)) {
>
> [Severity: High]
> Does eagerly setting ptr->used = true in check_func_ptr_read() lead to a
> verifier bug here if the function is never actually called?
>
> If a program simply reads the function pointer from the map but does not
> invoke callx, check_func_ptr_read() still flags it as used. Since the
> subprogram is never called, dead-code elimination can remove it.
>
> When jit_subprogs() later evaluates the deleted but "used" pointer, it
> incorrectly triggers a WARN_ONCE and returns -EFAULT, rejecting a valid
> program.

hmm. A prog can read the pointer and never call the
function, e.g. when the load is hoisted above a branch. Then the
function is dead, 'used' is set and jit_subprogs() hits
verifier_bug_if().
Will follow up with one line fix.
