Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3233B841B
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 22:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779833225; cv=none; b=IzW7UENY7dzY0vy0DC1S6wsXiRZvXQ1rmBm/I6ZzLVqy06IA91dRNRu4rIz7+9FL8TV7aRVE8YCdl/TF4h4SqMIOw5qGmCdgxufCb1EWmLPHfZfEfPbhg0pnQj2BDiGzX44AN6CCzaTzofSkzHmZgsdK26IftwmaHa15Upe7jOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779833225; c=relaxed/simple;
	bh=2sAK33zF3O7UnpDrhLVKxL1N6rkcwS6JytJQL1qq5+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+Ql58erFDqQauE/FhJSgVKW71J+4wi2ExAw9mgauQiN28LfS7CEqdd6lsy+zsnDxwUSPBbHuT04T/Ma+U7FDGFlAYnhvlFo615IhPsgL7PjMfNMm09EfJcT3n8lxdsrHZn61K5KD6yVukg78K+FXm6AKRWm8+6nloJuqMGZOmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0a3aP53; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0a3aP53"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3215209f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 15:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779833222; x=1780438022; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0z6J1iKZrTsnsU17iSRjv20Zjg/emO8a+SYNyUR/BxM=;
        b=q0a3aP53MXPaLrkb6v7sucn7eNoDugri542bRNWjgo49gR5qOj3NRQUkzAH9oE1Uf+
         NfMfGXc+BeCjsF2RNJiYhwOB5TyYKq357AFdMFHw5lWlVqoJh96BUJEiNGeAmShXduuV
         UXrdVAdnHVgXXJ2jQSkgJpdRCYsYuK6pVPALx7QyxWXLenQ0HjDMqAcyvqy9h3SpM8Ze
         AH1orzCMB5xCV6VK1WDpJjyZuKQhjT6rD/ivhCKiMNvt2lZt2S0z74qS/rGi6UUkBj5d
         dkyvUH7wFKR9COJHnKXXdy9H9t2P5EmumzVjOUQdZpH307YEdqLCd/XSRB2rLO+R4n+z
         AaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779833222; x=1780438022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0z6J1iKZrTsnsU17iSRjv20Zjg/emO8a+SYNyUR/BxM=;
        b=ZP2/YQ0Dl23+3m7ovAcZXcCcmQel5RlxshCPTqghzni9A2NsXIpv5Pa2YvvArEhWYV
         mmEb6ZxPPr6Vwm4dxAN9S2QXR8jcY3mEneWyFrSV5ngOXnpDxlh99BBBQuA+8vU5ZCp/
         0obWa02MpB21Nw1ErEYipO/dkOraQaLO6LhWcWItxwNNoY2IzYlro8Z1GClHsjkAS3bR
         TIMkmu4+wMclAr1PDrGzrN8zp7wTPYATLR4k0gvWcC/S/eoKnTa171MfWWj3TDLgAOyG
         2Tx2+RJtOy8DcPX3sWfZCqCLj6kljNpXMlPYsUuGXBbE+3H+CF2bT3BKS3SEt2cT4lYn
         /2bw==
X-Gm-Message-State: AOJu0YzzZc/YnswwQu1xj4YDt7ompaAQf7IjfnCJ4YgSzP9xvApPxUvI
	r/claRmQ0JXOitxLVk9TKNgg94ZZ2fu3Vkyo+Gb27+A8cbmBvlmtJ3wRL2UQh6WnPZxVzQ==
X-Gm-Gg: Acq92OESZMFZO27HhtHh+lataYFLY70YzRf1WZbwD3RgJTi6CFTDFDx+qUzShtt4PuC
	POb4lB0gomHtbABq/2c4HB2pQKADJKgueCq0s+draY13SxbmNzomK6Z5TzLAJ2juLRmP6D4LD5D
	wZxDteSmXo1eB6OvMnkxIgQOgPpJu1oG1EmQILsd/ka+SwvVjUyx9qXLtJ9O7BLjFXNFQEOuifY
	QncaN06rO0BVM6BVWtE/i9GcSgXHmyqqwN8EKEHEfLne2zzlhbaOnizvYbhNKIw9xF2EStXr3PB
	ewElfnS6Kntiugell0Ba3Lqs9EEkz6g1BDh3PN/DV0BpODH4q0KqEpFdnGT1596sgh33Bb4CbBg
	VR3CY/q5d6JDO1AUW/YgEqEpeI+BZ1i/pKdWVlLtPfy8bhEYIJoCSyWPcDThzqQY/dcvAJmUihD
	CWfu5SL0VEna1qmf1SOxq5xYquu95M2e2/lIvPV/4Sanjdx/9mAQ==
X-Received: by 2002:a05:6000:4684:b0:45e:d843:27fc with SMTP id ffacd0b85a97d-45ed8432acfmr4747470f8f.16.1779833221703;
        Tue, 26 May 2026 15:07:01 -0700 (PDT)
Received: from gmail.com ([2a01:e0a:488:3510:15a1:dbd2:86bb:c4e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a296bsm1117421f8f.21.2026.05.26.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 15:07:01 -0700 (PDT)
Date: Wed, 27 May 2026 00:06:58 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v7 4/7] selftests/bpf: add bpf_icmp_send kfunc
 cgroup_skb tests
Message-ID: <ahYZgpQR452LBeP-@gmail.com>
References: <20260526153708.279717-5-mahe.tardy@gmail.com>
 <20260526192443.843F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526192443.843F11F000E9@smtp.kernel.org>

On Tue, May 26, 2026 at 07:24:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Multi-line comment does not follow the required BPF subsystem style.
> --
> 
> commit 67ff0f6d65a210627d2fdadf8ec80c32d95d6a59
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> selftests/bpf: add bpf_icmp_send kfunc cgroup_skb tests
> 
> This commit adds a test for the bpf_icmp_send kfunc using a cgroup_skb
> egress program. It verifies that ICMP unreach messages are correctly sent
> back to the client and read from the socket's error queue.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > new file mode 100644
> > index 0000000000000..0dc6b6ceafb4a
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> 
> [ ... ]
> 
> > @@ -126,10 +126,10 @@ void test_icmp_send_unreach_cgroup(void)
> > +	for (int code = 0; code <= NR_ICMP_UNREACH; code++) {
> > +		/* The TCP stack reacts differently when asking for
> > +		 * fragmentation, let's ignore it for now.
> > +		 */
> 
> [Severity: Low]
> This isn't a bug, but does this multi-line comment follow the preferred
> kernel comment style for the BPF subsystem? The style guidelines require
> the opening /* to be on its own line.

Could fix this small style issue if required.

> 
> > +		if (code == ICMP_FRAG_NEEDED)
> > +			continue;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260526153708.279717-1-mahe.tardy@gmail.com?part=4
