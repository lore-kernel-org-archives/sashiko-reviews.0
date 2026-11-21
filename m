Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286969;
	b=IKsyFuff9UHpI9Bul2vVPYUwoy2usTSYqX3EueRLO+yrqJBKRTTolwMpn5W21W064aEK
	 ZbkXci0Kq9TcL7BRKXXCoTZdIUI0CKjzN7EI4O8tZRoqWxUOr9J3Nck6mkG2Husm/ILDm
	 LoTLwbOnPwnt8DJ3W+WmeYAQWDdpzt6ZitGGdZc6qhuLpZflELr7BNHC4IVMa4DRe8A1x
	 h2JzRC3E3COWLgZ3UKB4aC0J/4dRzxa1FTEUHAgPRIy5fh6swMIhUUxJmtNyeCDdu0CiH
	 zPbSClIaiNrz1akp60nD2S1HNihIn9oEFFTCJAvksZYVMEUkpftfkTTha331z0TkH8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=IOPWZ6lehbHK1L3+BbbWGiJJk09EnHKGCl9qIhtihN4=;
	b=UZsqXzP2Dc5eXT9wL8C2MIpUNWK/loZzBAmwoLkpgfNhlsOAuk/ckOWPGgA9VaU6fxgI
	 Mp0o3L9rINt9XQklita8kSwj5YNZaLSa3/OLfg/BToag+rxXtxtFFBUnw0rufNg12dL6V
	 I3BP5EdkefuetYiBXJT3tTlF6/MefNhfe9nvwIouFEiOr5oemjYuiu0YF0kJBLxgHPd3G
	 osa21j9Ln0LEeG8eHGqbdPoVnY2O8h6hL1/nSvlsubnmPPItlDOtNBiCTRVtJlXOsvY/C
	 QtlPDEwc7gGDr6qoFHFrpBifrUKyMD9VFtrvKku36T7oDXD0UnSuro4xpELTspfk1yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FgNwMm5K;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2902606A320
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 18:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2902606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FgNwMm5K
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ee254f6eefso47075ad.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 10:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286968; x=1795891768; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOPWZ6lehbHK1L3+BbbWGiJJk09EnHKGCl9qIhtihN4=;
        b=FgNwMm5K8lKA/3kc4oDghfsA1I/TtWmU1PKRC6nnCVePW6fXedZqPVXwZ98CWeqwmA
         aioSWjTyYwzPn5b5IUHr4hpZI0RbrfeDhVM7kF+zBBOn7/IB279DA+SGC4kQt9nUQpFa
         mnzVGBeiQYFD9fXXfqZgke0Yl3Si5v2p5wQKFeH6qXBI5I9UF5PC0gQF7yOGZXTuRNyj
         ZfR8P2jTZfGNRNeOq9lvJT/BTl06ggiVd4qEW+y7qECdoImesOZJilj6odrnFVSpfTdC
         Zdjj3fC4caK8gjsP/p7Nqj5Pm0dHxlYj+rKQrEXfajyuqgh9HeP1fdbhNBY0yuxy5e5q
         /e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286968; x=1795891768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IOPWZ6lehbHK1L3+BbbWGiJJk09EnHKGCl9qIhtihN4=;
        b=k4xZeTFmxyAWbsTihB5baZOi5gkYaXMTgaqXjiF+0zQsU7f5TBKFlx29fuaJ2Xy1Ig
         NkgYL7lemd8YRUz2lWObz/3/XqLoZC+osFvxQ3htIQZ3lOvHUUJOtUbsmuIihEIYNBB2
         uUVGvcgSzAYkdMNSs6saT5kk89XTbtT55TbJho3f7Z4pUmyVQUVbXWijHW0weK/63bQP
         SI+XtiEUn+7xhhwwT9OosO8hKVy1Enb63Cxwp3nh/mhaw9d6E2bLj9ZPvTJGx1hcPlWf
         YBOV2Vv6UsFKkLgli6fM1lXCaHGHiL5nM8ola0UxRcl29L0V0GkmFbyXTHt/+1TT7JdF
         S32g==
X-Gm-Message-State: APuU4Z83bq9w8IWh5iah2Hv8cG6N/D/FmPyBfh/Y3MQzcJhjXhtxsHTy
	mTziwQY8PQ10gr5B100YnR9k2LEPHAMZUVy1TvYKhlkwwouoFTiSe+iHcGcnLEKlJJpAw6HDDv3
	QfkVMUA==
X-Gm-Gg: AZFdTZc0roXQgv89w52St5JwcuR9CUHoebEs1svHCQvx9s3DNymnqTpBTgHPSRgoTU2
	j27C7sPF+5cGzRuwO8r9X7XYbwrxEIcfEhYYtd5m6nvW3Wsaj/Q5LL0/WREx0TSQI/UZ72WUt8J
	7DFf5csjmlUqSMoab/w0UwtsRumSHwRRtPKpMzZvwGViYCrG2abVn0P+fteAjZgTkQSgaN1lhF5
	q3W4RlbhPTGJm7+IPb14vHiFniPNjEThdCzKQLiyzuirtYh2tscPorec3jbJVUoeZFyom770QSq
	xAYl1GA7z1ayYML5KZi+BFkDxifPl3UHiWlac2dnDqzMwpNxliIpPNEVE6VCLnTeUsDrYdWHIfa
	e9tPy94trhkXKqAXDXAty/PKeY98yM76sDYgcD0HwskMKe9dkKaVzFMkYHUwnT0p1ymmHbBCUyB
	VZP9YVVfvh+skou46YjgtiQuz1H3vfGn2UnG+Si7kRjY23FPFsthEqZgPgiCCYhX5NJ55NKLoR2
	gMKZN7VRRZZ4RgLMhQeA/3YgcFoCIwX43onYHuKaKH0LZfjIKewbsQRKFyni2KcMrlNas1LhOpb
	rt9E3xQpm6iofmkOjourB7luJ0nSEwiGB8IaNTgVdvXoww1CklxKckUvXtq1rUuOkJRGRnsbAUW
	YC7TCadhGX74DLITddZ/+Sc4NyczSjfXjjuhLquoguY1dyB73097QH3z11H/fdae8SBj0+yeEiM
	JIbd6Y/IN/voBrz0VfjfG+0d4aZQk78aw3FDWoWg0SZvw/ACdizy5R5fSvNqHzzCNJx4Ow450wX
	ZtGBAfXrkWFROHSow==
X-Received: by 2002:a17:903:2407:b0:2e7:e742:8bb5 with SMTP id d9443c01a7336-2f0666c00e3mr2926165ad.14.1795286967604;
        Sat, 21 Nov 2026 10:49:27 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm9311009a91.0.2026.11.21.10.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:49:26 -0800 (PST)
Date: Sat, 21 Nov 2026 18:49:23 +0000
From: Carlos Llamas <cmllamas@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org, gary@garyguo.net
Subject: Re: [PATCH v2] rust_binder: disallow binder fd transfers
Message-ID: <awHnsz0JL2Igtp7u@google.com>
References: <--in-reply-to=20261118112933.477541-1-aliceryhl@google.com>
 <20261121182803.2600723-1-cmllamas@google.com>
 <sashiko-outbox-227261@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-227261@kernel.org>

On Sat, Nov 21, 2026 at 06:35:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] rust_binder: missing Fixes trailer for Allocation::info_add_fd()
>   fix
> --
> 
> commit a963eb2d22cc916873581ff387f2fed49b4fb5e1
> Author: Carlos Llamas <cmllamas@google.com>
> 
> > rust_binder: disallow binder fd transfers
> >
> > Transferring a binder device fd via BINDER_TYPE_FD or BINDER_TYPE_FDA
> > has no valid use case and can create direct reference cycles that
> > prevent Process::release() from running when a queued transaction is
> > left unread. Moreover, a binder file is bound to the opening process's
> > task, credentials, and mmap state, so transferring it to another
> > process breaks binder's per-process ownership model.
> >
> > Disallow binder device fd transfers by returning EINVAL in
> > Allocation::info_add_fd().
> >
> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
> 
> [Severity: Low]
> Should this include a Fixes tag for the commit that introduced
> Allocation::info_add_fd()?
> 
>   Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261121182803.2600723-1-cmllamas@google.com?part=1

This is _not_ a bug introduced by Rust binder. A 'Fixes:' tag here is
incorrect. We are restricting a behavior that has always existed.
