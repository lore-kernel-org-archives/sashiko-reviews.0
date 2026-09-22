Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ED8395DAA
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 02:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045630; cv=none; b=TNblB9nXCW4uXumZEK9iAhoCcRueLyOzWW5vInI/Ch8NIElyKt/vmkp8MbAiiWqNV9yZEW/ykVzV1FtAgRbjkQrH1dBRqM7ljGRcRSrd9Y+712GznYHc9GZm7LTTMV6KlVamkBe1HPnU171IDBgFgLLf9nDegQ5NdC9OJ3je6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045630; c=relaxed/simple;
	bh=D6FjnGUFqSH40VtbextCoCSGWM2PCQTatVfeoTll1dI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=D+JpZS0Nz+LvLOqcMJx2TQSFb2TURzfaG6kuJLw7MUXNSdjQXuJOW7SJoQbRpe0OVkII1GnSJ/OsH54J0wONjgaYO92G1r/u1f0Gj01gJTU2YaN7jLLAMXjPnHWXTC7PoI7WLWN0HdhFTlOrYXtqOGuSGjTE5yK5QPK5Swtm3+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rGiLAfuF; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGiLAfuF"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1542699a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 19:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045629; x=1790650429; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wM6/yW5gI/hDw4+S5ggd70K1fst5xUknVJJO18BGc/k=;
        b=rGiLAfuFtSzeSacHD2kkZA9teDbDj5EEfRqtjh8nlhVqLSh7ID237X0N6hEkbZ7WYd
         FQEvWXt8FwW1kq+Ob5NTyCJMxozD0NOsUCoxwU+AjoXreoD+qXBMyFaJ+TOanj7AeemJ
         1s5MWeG6C2z0c1R0SeOp9DJTRNC7qqxB1o7TvUB7MXREGGUBvgc//+EOOna9H/yudm0b
         QXUUQyHAEpIoZXjF4v5D/NZLcIffNV/HKWTXsw6G3pMdzBtXKPvH+096DyU6BM1VO4st
         S5H8TQJCFe2xsYsD0X0yMY6NJnNX9lcu6endFtiiTWZHHjw5fE4bsTBlwa01YGhkIeaS
         OhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045629; x=1790650429;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wM6/yW5gI/hDw4+S5ggd70K1fst5xUknVJJO18BGc/k=;
        b=jF47XCvycvlawZ5hygiKEmj36gbhGQQBl1q1HBBoimVhSkvmn9uPTysX2aF56d7a1a
         GGpJdnerVuy8cZWnkscrKQRXr9DiudwCpFaDHgEj0igGumANiPijnl9eFiPzjl4kQrfW
         oGVXGjVmixZVkiOgMWHJYEdmzlEDAfzkh5cmkzP5gcJH3hJDzmJSTAOk8FkpTulZfvAD
         eZEXEHxhp/CgzQtSO5qt4ckBgVKNdWTkJC3q++ta3JqngGGXocHt8K9SrVhAENKmWLFz
         xQQ/H8P0wjGjAOIEM70op8enw2/ZWlTuR3P192b5QC13s5+b11QXDslXK37/VvX+S3uy
         k0sA==
X-Gm-Message-State: AFuF++nPYPJ3VsCf/fcf/YFlJXgVUhhinG1WQOZSSoVElwSTkHVeWSEn
	3FnSdsXX4eTnqc+nhCC8RjFvUzd/mifUeb4hvg2WEdlptkfR6hDqVEa1t7UrIQ==
X-Gm-Gg: AYBFou1jQrCFe60HGHJNMVd9RD0TWmRdYS6GdSDDVf2ZHt9BYYvhoCyLolxpxA2dQRn
	yBI/PsVPTn6AB5mA7DRfA7dENPDkPfmIT17XCa73QEmWfEoBV+D8b01/IaFyfoiWf0R/5i02rnd
	fXWfcOUFYjI+EAQLiR564tD6yOTp5a2QeVz4RrUk1U4Q95aJZk/GiXJFgST5bZfG3IyUXsRq/r8
	lKuYDYTMdWugeC5nzjeX4+LxIn1u3iTxyqAVOmJQOQlyIm2g7CsxJO1weI22hnfFCChm9pmVxP3
	fAZWlcCev+3vvET5zAVKALjthnaGyf1KZ+UZhaLAgClYDDXHvNdbR0CmLC+TYKFSZYLlGbhxyhk
	CPsG6HOWH1p11vSv40jLACWSl4jDH9lV1PORW68O9uZ10kPidS4r14BDWPd+rAH9RBttoE7y3lf
	h7u/x20g5NEgegZxEghYl3OPtkQ8zP+4zIyVszw3ng1AvaUo+mEqQ4Joq7zCnUgXVq+MtrYYNws
	RaTfIZ13Yp4NXuCgHMGUIK2f0T2AVIzt6Itp1sBcXLWiRTMjTihnGKBg08Lk7FuQLOpP85XGOxt
	K30svzd7+m6Cxw==
X-Received: by 2002:a17:90b:3c85:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a066b93b39mr1034411a91.38.1790045628556;
        Mon, 21 Sep 2026 19:53:48 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e26e6a2sm583523a91.2.2026.09.21.19.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 19:53:48 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 02:53:47 +0000
Message-Id: <DLLI7SYQ437V.386IAVGI0TTLZ@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 07/17] bpf, x86: Add JIT support for callx
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
In-Reply-To: <20260922012712.6B21C1F00893@smtp.kernel.org>
References: <20260922011323.1298619-1-alexei.starovoitov@gmail.com> <20260922011323.1298619-8-alexei.starovoitov@gmail.com> <20260922012712.6B21C1F00893@smtp.kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 01:27 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +	} else {
>> +		__emit_indirect_call(&prog, reg, ereg);
>
> [Severity: High]
> Does emit_indirect_call() emit raw indirect branches without KCFI hash
> validation?
>
> If KCFI is active, it seems __emit_indirect_call() emits a bare indirect
> branch instruction without the preceding caller-side hash check.
>
> If an attacker were able to overwrite a spilled subprogram pointer, could they
> trigger this execution path to jump to an arbitrary kernel address and bypass
> KCFI protections?

Not a bug. The kCFI hash check is what the compiler emits in front of
indirect calls in C code. JIT emits the callee side only, see
emit_kcfi(), so that C callers of bpf_func and of callbacks pass their
check. None of the indirect branches emitted by JIT check the hash:
tail call, gotox, trampoline. callx is no different. The target is
PTR_TO_FUNC with zero offset. The verifier guarantees that it's the
entry of a static subprog of this prog.
Whoever can overwrite a spilled pointer on bpf stack can overwrite
the return address next to it.

[...]
>> +	return cfi_mode != CFI_FINEIBT;
>
> [Severity: High]
> Can bpf_jit_supports_callx() incorrectly allow indirect calls to be compiled
> when KCFI is enabled?

No. Same as above. With CFI_KCFI bpf_func points to ENDBR after the
hash, so 'call *reg' into it works. With FineIBT that ENDBR is
poisoned and the call would fault. That's the only reason FineIBT is
excluded.
