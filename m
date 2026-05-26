Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941583FF1C5
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779805821; cv=none; b=VKPoX6O8bhDJmwfnZR9B3/7ZOd0vSgAPa1FXRfivfIdMfgte/hsK/U5wZgwLne4lx+M5OHuOAldiz+cKtG7No5lCtk8m5q3dsuEItl4YaWgWomcFKN9OsSQ2mrADR5EzchogSnrHxtquLBm9zr4igBilJwGLEMa8w1/H3fS1/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779805821; c=relaxed/simple;
	bh=lG0SD9cXN/5Qk4VXl7q4UfDEDkoq1CrJuW/0BYgMDBI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgwPPrAKgkt7lGNFg1A+kcCIG7gLQIPmvUDJ0my5xw9/LPERdVCFzftbCxFB2FZNzEdjZqAF9g1GR5i0shrjTjFUG6PG7DkxxD4zt+4HwtKk2HjY/5fo67yzQu0HGahPvt52wBCTLSbGsXwArhXAyiWwVcO3+8M1zC7X+2+C6GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTra6H1s; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTra6H1s"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso92141315e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779805819; x=1780410619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T45Ou7ZWfmCD8W0zzIfAADcxBltvQlyL9M3hYTeHQiQ=;
        b=OTra6H1s7tVIJhHq9WCpFAmReRHjT3CViQd8M+iyG4XU6UeYptJ/MubWQst0LqaXKH
         q92OllukLNM03ikLXITOAQZeFZSUJgR1upnc2hxFXfMdjUkn72ookZFqGHkekbx3mBCy
         K0KB8BfwNrbNxxjKzOWNd1vtCLtekPNd5rt4E4zXiDgC6mPfsL5ZzByuSiTR3HxyO9Pg
         YaEq12rFHMTBlwS5pebfc8kRgjUs9f/9XKruWm/sDyVb34ocwLgLlRTJA7EpQy2oDs/B
         M+pP2lNAai7ki67vBPLhKTL19JbsECXY+Q7+bvMQMx5XcC/uPYBR6d3U+p9djN6nLp8k
         G/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779805819; x=1780410619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T45Ou7ZWfmCD8W0zzIfAADcxBltvQlyL9M3hYTeHQiQ=;
        b=neWJ9H2WD6OP0avuot59ovxL3Yw5PzNh8MNTwPAXcW7ca9oqjMro/zUhHSUCsQEGl4
         h5oaG9Jfaf2tFfZ1B/zOKjwdT+gsS02QnPBwwxLbTheUKeF8lIGVd7rHG9OhJc+V5l6L
         CQImr/Dl8H6HhJIO/gzu2W/ogHKH9X4x3XG9yJs25yHw73b9lhUYlgKh0AsKAFfNVFgF
         J+UeFMPrx8jNBC0nlfkScDTSgfDRAMyuz4S801hmSHd0DMRUY04zgBeTSYmE9jWXR9yw
         5jWRN3COr60YH5/Z5NreahlfveRO7ywwW6valevz56qrraElQl1zMLeTfM5Dxi/55abt
         qnYA==
X-Forwarded-Encrypted: i=1; AFNElJ/4u/6CM+X8wy266iP5QFKX2Uf5a2Ev03VUonFF83NlCWOauQ3xthdFaeAf07vKZU5ZBXlvXewc0t22p94aWIE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNp2VpoW2dWQpFqsED588GtxIAXW5dkwgS/HBHSKe6PYXSna8x
	iBok6VYYPXJ64AgfcL1Oe0a8ueFuUlHJwidTMLHhL9HAV5OKr8E6ngVe
X-Gm-Gg: Acq92OE1vFpQP7Okqz5OjJf9T+HTzT6xGU11q7a4+6tW0R7pqxRjU06VdAWuNRn9BPH
	GFhpfV/2xLJ7sAewJeZ7wYx3yzvFbUfCpJHwUsJ59y4uZ0TZBQYtf1O2HCaT1/lkIDii6vq9qjf
	NcUppqREa67Gbiye77Kh5MCmriRJAhd+ZhUouhqMNa7qw8equ6yktfkiqZjQFeAL+PvqFsOKtvZ
	JP6iqZhZ49NiQfjwYvXxhMIfsINZTNLmfswcJFhyqvXm+FC0bjZfq0QGPYjBVmIRAXGP1IDQQHx
	qK3ivJ2Qf7R6hByur6GTpo88wBNbapTpyZsjJdgMIkibAziXIxuYAoHlh2MKyeJFzIYWpa2mDoJ
	VeK4FbF/qaoJkZd+WDhY+PJavPrz/xrapWx7hWgzc4H8q37UgkZnOo/iTlG5Hr8LfULTkJAZBPc
	P67EakSY3cUSLNd/EwTTfVPK/o8FQ=
X-Received: by 2002:a05:600d:6451:10b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-4904249d11amr228458775e9.7.1779805818565;
        Tue, 26 May 2026 07:30:18 -0700 (PDT)
Received: from krava ([2a00:102a:403b:6530:533a:f167:d705:6aca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e5adcsm124007855e9.21.2026.05.26.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:30:18 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 26 May 2026 16:30:14 +0200
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	bpf@vger.kernel.org
Subject: Re: [PATCHv3 07/12] selftests/bpf: Emit nop,nop10 instructions combo
 for x86_64 arch
Message-ID: <ahWudlB0zTRvfBE6@krava>
References: <20260521124411.31133-8-jolsa@kernel.org>
 <20260521132121.EEB4E1F000E9@smtp.kernel.org>
 <87bje277zf.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bje277zf.fsf@cloudflare.com>

On Tue, May 26, 2026 at 12:58:28PM +0200, Jakub Sitnicki wrote:
> On Thu, May 21, 2026 at 01:21 PM GMT, sashiko-bot@kernel.org wrote:
> 
> [...]
> 
> > Would using two consecutive 5-byte nops instead of a single 10-byte
> > nop safely provide the padding needed for a 5-byte patch?
> 
> Perhaps worth clarifying that nop5,nop5 wouldn't allow us to leave the
> CALL in nop10 tail after the optimize/unoptimize cycle.

right, also we need to have single instruction for that
to have some assurance the app won't jump in the middle

jirka
