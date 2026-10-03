Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4041A57D
	for <sashiko-reviews@lists.linux.dev>; Sat,  3 Oct 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028057; cv=none; b=g7tCgudM1WpLr/POfcie4ZeEsIpgQNPJM9BmzmEECUla1gkuiZgbP+rur8UtF0GmJzDxhK2st8OoiiLVa3yfaAfmNNWMGFpsXePmiNEcI5siYeePz7bW6OIg6cUExELcAUJMEn8/ywUMeZXDgh3ubLxSmQ/oP0cfOMN+XnbwRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028057; c=relaxed/simple;
	bh=W5faO30N74t7sxHyDVY1DBc72S3l0txd2hQ2mRetbps=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=h5jlrF4Jg+iGBAtFPBTS3Icsn/aBvYMe3+nwRPtKouk/mzKwp5SjM+28krsStJXb9BLilWJOv/3LbxqIx0HPWDqqm/GMpQXZQhc32xx0Owxm5yxbVgIh1IV1fPsYKeZIJLjuBUhczO3jQ/Yz7ECOaPTU4IbWRLpWZsVOYbfz/d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdbNa4YY; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdbNa4YY"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d58a3b05so2606465ad.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 03 Oct 2026 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791028051; x=1791632851; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7Uo1B/Ey3qUdOJCK6P/9HdNum+iFz1a+CmU7hRQ4Zk=;
        b=FdbNa4YYt68879c/eSGX5AoHzeImmKju5SWpFGAWNOTOCA9RWetgGkPRi3inVMoloO
         WZwC4z+fKrG0Hcv/jWnddBsAwfDjzxYz3bevw4jEgK2HTcX+VtxLlzb7ddyo4qtjWwmG
         /caFlweDGnt26R62/umITfkZt2HrYjfZFkHKKhXF1UBpc/5lXSEtqOIk9a0pdgtMVp0S
         srsrLtIunqPHrHiRk/ISNOv6ekyo/Qh2IxGn0DeLj/5VrrQ52cGi5AifKY1bmqVLbskh
         5unAAtqQCmMxC92qrenoLIA3Ycfc1aiMh3r0Ue+27MNdS9EXFLd45oup/iZTqhf1xbZj
         9aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791028051; x=1791632851;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7Uo1B/Ey3qUdOJCK6P/9HdNum+iFz1a+CmU7hRQ4Zk=;
        b=rA/a3qAgjEQ9/J+wS7mmNjq9bb8OfcGmgu/SNUq8df9SGR//JlJeWtGMqrJfVzBEQL
         WtzIgNoHeUXqufhtaYBmOMLM4xq7p6SPy3HNbn75G979lN/Gfc4u8rxm4xX/gvDDHMW5
         aHatJ6YLyg7ctGdjDM6JCVO5fpr3OtdSQ7+taMEjCDphae4GpaeoW7zLr9w8NiatMRLA
         Zp6atSh/IVWTIVULP1ORfg031UtjwISdMsU9NsocCaGN0lSfyTTegLnPsNSAGh435sBP
         f9AWDGE0I+CYZ7SN7Jrmxeme3bqAqFXZLMpsvo08n/3q/HBqcpzTZLYTejgMOPPIKqHf
         JPRQ==
X-Gm-Message-State: AFq9FYKV7G8gbsaiZHtHAyeWqgYA/uEaZhqwBylTMGH+tdL86HJb5mjH
	JNPjoEOMLdbEfbRWnVfQbeFmhb7RVKpOUpeBZVjaljeFlqdCaLniAMoguq9eXNTX
X-Gm-Gg: AYBFou0ltXrAr2z8FNkPke3Nl5YkrYMo5v8CPh0heXKJt8y859tE7zmSyqtIHjsN+5h
	o3PB/rD7+u2BCjucdPULROaJG0pJL0GfvZR3hIlYzJlqt0BRwM9eBJj3VTPenPGf6QhPgfx+q/s
	HWdgH1oGfGbfvilgne8+5f2a//ANVDAABM1wYlV9nlDUnBHgwlyg9mPO3NQGgvFX9DRR1QCQ6SX
	TactLEyOgH2H1QfOXecMSM8z9ho64DbehDnLN8NZ3CNwxZafhEdbFxxMLN4Bb75qygT8wUHmgB4
	j7/Vf3qtt0w8fTopTJ5fBb/tx6H9beKHH/PeCSHKUktta9PkUr/Vq7PZtoN52Y+o2/KfaqBQex1
	XWhq2L10UetwMY2Y0/Ul1Rkm8zq8edffwT2aTK/jRRcKM1/fc/XOIVqnSw/eWIvtpInAaTl5kgs
	kLXwUW3qVyk5zWsZTsdNpBSE1hfQVC8R8We1Pa6YXE79g6SO/wuJBGV/4mGqGBNro2nU/8Bd/0P
	ooAFVitEFv7bUrBtFM9eqstzegqrH8MtO6Yem+8NWRQdesYEXVOiBAjTuQvDG35WI9aPLNwvNod
	ZGi5
X-Received: by 2002:a17:90b:2cc6:b0:3a7:9045:fe40 with SMTP id 98e67ed59e1d1-3a79046041bmr1089278a91.50.1791028050636;
        Sat, 03 Oct 2026 04:47:30 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e497230sm2655598a91.11.2026.10.03.04.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 04:47:30 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 11:47:29 +0000
Message-Id: <DLV6GFFEMPEC.3MK9MWGDF2MRJ@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 15/15] selftests/bpf: Add test for global
 data of a program in Rust
In-Reply-To: <20261003013306.493601F0089A@smtp.kernel.org>
References: <20261002124714.180012-1-alexei.starovoitov@gmail.com> <20261002124714.180012-16-alexei.starovoitov@gmail.com> <20261003013306.493601F0089A@smtp.kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, Oct 03, 2026 at 01:33 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +	ASSERT_EQ(run_prog(bpf_object__find_program_by_name(obj, "list_in_data")),
>> +		  100 + 20 + 3, "retval");
>
> [Severity: Medium]
> Could this result in a crash if the program is not found in the object file?

No. bpf_program__fd(NULL) returns -EINVAL and
ASSERT_OK(bpf_prog_test_run_opts(), "test_run") in run_prog() fails
the test.
