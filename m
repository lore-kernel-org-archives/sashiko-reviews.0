Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA733555F
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 06:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823807; cv=pass; b=pNAtl5/Or9lKiEzImIE7Ygu7FBN5ddpW4kEZgLJOSZozkZyHauQZEbhJgY504SRa+qOTf/UIsUT5EqXB3w2HtV9gSE35IoG4AkBTomoJLT1kWP+zjR2hjg5JpjnNFNUIU2U7tUHasuPTpRUi/BibDiq0SeDWSsd00Jmxo85r2ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823807; c=relaxed/simple;
	bh=a5WRpkzvBDUVr7xugOiFRcaxbPS0kFBbyIpbYm1j7Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLzL03bMKg6gMjQJrMRbTaR0Zcg6MEEc0H4ti8hB/vYX1IG0gCVFfq3qDfdwJIhvzQB0B6bXYc7pkdL8I0VlcLIIVEf3/6J73VKHUoOJYkjWWcT2B9ax0Arztd3hAxrp36CLdbApEnD/AYLlLQ7V7v/TBNOqOfCGaP0mZzpWCtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=y4frb7br; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="y4frb7br"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c0ecfaee7so25755931cf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 23:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785823805; cv=none;
        d=google.com; s=arc-20260327;
        b=icDvlJIdj8D0uN/wjIcKmgKWEa3tlOW8xviZdx89+tW9F3V6VtppHFgAzNsMq3NmdT
         PpjsprfT1VAl930s1Yo768CFKX4VmcZ5sCMBtyhvy3h/nIhvn0npQwGdYXDvO3J1WyKl
         +onaDV6a7ORmv+8625Wj/Zw59G4SDWpO+6trIMmQce+YvJttrYpKUXzuntZhCYlCCFrK
         dcErnVFJWNwsMD5BezhbgmjFnlNUkBr59z0/srBl35mBFAEPmgePMI3V68jCboDUFz3e
         DOU6QujuG0e6E4QiA0rBPhMHBhf08q9tI151BQirFwnK0JBtVO3Y/Tc/xwuGou0+/stX
         kxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a5WRpkzvBDUVr7xugOiFRcaxbPS0kFBbyIpbYm1j7Mk=;
        fh=dDAumcgQ33Fwf79p/1I1EFpRzWzhL3DlykLAU5ChR1E=;
        b=C8cqf2PnrSj6LyR6fSKsuGJavEBrKYfOHkAsxH7SpVyFfS9vw+NA3saj6RVxg82W2c
         gmfo7JZ1jHbhBfaRaaUcNtUtjPf/rltJeX+m/wVJWLlEz25gpplg+s5CfKkoWpQhmteB
         0uIhoBb6zp8PQRUbvxQrwkuPwXC8ysXBDTGS16WaxTNTHlFQY84XwxicyvdLjcb7Z2LS
         Zaxg9w32x3ezP2Xa+ID4BirK3XARBnMyqsX2d9na92P9eUuo5YzjabF5IzmSEE6JqQgP
         XYth6vxS8r5nZIqwjRK/QtX37zBl9FcA3xS+M0LpU+P1LjdhDF0I+P0WkUtIu/fX+NBv
         9c/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1785823805; x=1786428605; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5WRpkzvBDUVr7xugOiFRcaxbPS0kFBbyIpbYm1j7Mk=;
        b=y4frb7brhii/D3v0/kxSWTyVuPqVMo3cLhtchVe0fvqkIuLkgFOeAM9qsB/ZxPtQI6
         rQIYsXbizALXDTn+fs+abw5+v3vPGgwaEPeNxI7vLE+sxWKFBr4EtF9ONS70jSg+QXz7
         8D8n039pTHLkguq6Z50zA+HXNjiw6coSJFYHRbu17ZR6FbV0uF07RGrennSvL1I+iZpk
         mdZpUSSDWJXmbdejzVcRBVCMim5xUZfwlFWXI8WnOnukh6PIzQzCgpL9LwOCLCyiViNt
         r/EZfLxDoEYLfChDAqCAyVSN6jgvQAdTB9KVgVFSuJ+KC+s3maqqCFVWdj3PWVqt8Lct
         FQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823805; x=1786428605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a5WRpkzvBDUVr7xugOiFRcaxbPS0kFBbyIpbYm1j7Mk=;
        b=qxHw0KKv/S15rPTnlsW3XLHnuw2Cnf8hJ1Gv0jA7nx164KiR1QUnuxq14BaV5siPBf
         j5NB4s1ofux+Y2jETKXnFvnA31LcGm+z7zaKholkyZyIN1S0c4GiY9TQyUz/5K5oYle+
         Q1klfj3bxOp+IWCs8c1vVIM+Ri1qkZ0q2sC0L+RigpuDPtMugf8O1OP6s0ljVn8vZXUo
         mlXGMsxll4rPQfgfuSuB/yej/EPO23hsLQTV57275XxVsn/7vz8AecrVr8HkyorlFli+
         HbP06PeuJ8PYUaoxqE1dju2T7s+yZTDnYULNa7QTixZRK1PnD6benalQ/lXxpxKwhTJa
         pAvQ==
X-Gm-Message-State: AOJu0YxdICKflH3S1YcZLfLMbsFtaPiOrfbAWAkErfr1DGfyRs8ip5Ou
	X5GkX9GUeOqiGbHh9vLl7kbPXiEDFdBbi4BUvzQGK2IfNe6CqGiRGsT42b+1nWL70lHj2bndCgx
	IoviQAT1X2pzZMZfTGJxKLWYtKAc337qGtksQNBujrou9dlnjRllPwm0fBlMQ
X-Gm-Gg: AR+sD12nzpdO7PP0lLkuYm4kzZIB8mDJ0sG8SZuN6FqvdeAl2fTUG4qLzvSS8oUv6VS
	SrhtRNQSBokWCZllmgBjshJSSBcIHvCmllj2boXpWGBB2b5JALeQx21balmEYOGbPRKxVjo7Mb+
	D3CGx573xATiIAv+MVSxwhxwhQHUE1VFDOpy7/5xlDOgyCEBdV1KaY+dKyNzZwl/zQl5rvJmra1
	ehXzpw3P2g+Aw8F3R7tCB9V1zyNQ+3zWaK4aqvL/iVhgiPmrF7+1emZsbsoo0CmQaEhj8Oe7Qoz
	AeWXVmC/Acj9rDSp+r5WXCSP0/Dfhuh0kfJMWC8AQzwozvFyZQPs/Lk=
X-Received: by 2002:a05:622a:53c9:b0:51c:9193:fd9e with SMTP id
 d75a77b69052e-52b566dd26bmr285053611cf.15.1785823805225; Mon, 03 Aug 2026
 23:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-ata-acpi-v1-0-f606afaacad1@thegoodpenguin.co.uk>
 <20260803-ata-acpi-v1-1-f606afaacad1@thegoodpenguin.co.uk>
 <20260803151417.3DB001F000E9@smtp.kernel.org> <anDy13qZ6rr1tFqO@ryzen>
In-Reply-To: <anDy13qZ6rr1tFqO@ryzen>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 4 Aug 2026 07:09:52 +0100
X-Gm-Features: AUfX_mwWoxNiEiKFO7YpB4PerbiuIoha9b8E02ql7BazlhlXy21NTJ2evt-pFQs
Message-ID: <CAA6zWZJ_TCa4CyEGFd-a-u_NS=Dv64KV-HONhomER2PC7p+EyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ata: use named initializers for acpi_device_id
To: Niklas Cassel <cassel@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-ide@vger.kernel.org, 
	dlemoal@kernel.org
Content-Type: text/plain; charset="UTF-8"

>I do kind of agree with Sashiko that ahci_seattle.c could have been fixed
> in patch 1/2 (rather than fixing ahci_seattle.c in patch 2/2).

Happy to refactor in V2 so that patch 2 would only deal with removing
driver_data = 0
in the ahci_seattle module.

Kind regards,
Pawel
