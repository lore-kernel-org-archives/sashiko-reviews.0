Received: from mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560451C058
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867455; cv=none; b=gmH2BB6y0BktP8IsuXaZzkwVu7p7A+NCsZ9JTM2511E7jVsMjRlOWYu6s1JkP3lhvn5Ayk1IxoKATvbtsnTGautsgVqg+KW7SRf8+oeHIG0kM85bMn3E5mrEoGt7T0N1Yy/IS/QSRVhH2CiKz2MRrkjlSUhd8htA0zsPCGWnQ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867455; c=relaxed/simple;
	bh=zyQ1FROdiUq3DNEwgy8qntsXEFA0atog2LJ+5V12znY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjBgtxosRpbt3HIrrbogg3uDvVpCvwFPFSZiMaVa15e5KL0p2dbqXaFltLyDE3RrXh6dz6ADoSSkoIjutAiB1qrisHDf0FRLPSFeQPq7YwATqUTXaA1qGM2fcFjSsDNj0Eh3G/tIoS6Odsqk+KaZrxTvinK4IRCWsq588j9ZW08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GhFC80Sq; arc=none smtp.client-ip=91.218.175.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GhFC80Sq"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=zyQ1FROdiUq3DNEwgy8qntsXEFA0atog2LJ+5V12znY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790867452; v=1; x=1791472252;
 b=GhFC80Sqbih/B490RXuqPwz4/UppwDrolCqo1qm1yQrr6a08vXzTPJSXytlBg4E4aS87n0uz
 Sgbagr3xCo8/eN+0OgLQNUpVHR/copG7ssOyLym1XE6VeHdf4cGphPDugvquy9HaCzQdjZtRMhc
 zaH6zsx1vi1qRx4yXwJh3zK4=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c7b890690934afef;
	Thu, 01 Oct 2026 15:10:51 +0000
X-Mizu-Trace-ID: c7b890690934afef
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so8676e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 08:10:50 -0700 (PDT)
X-Gm-Message-State: AFq9FYLBk3DxLMM4Fw4Xx7zAmZyWiV64GBlXqZlb442nw1X3q8MfWwvQ
	kjBHBL5JMUo33coFs3u+0wcjhokdWwEVgFO0gI9RCf+NiCtrmbXm3l1w9xuNkcOJd3xBiKx3157
	rvjUcMsGCWBBUJ47iZQY2Z4M5EbfkhagTgND9Web3
X-Received: by 2002:a05:6512:3194:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7944842dmr65925e87.2.1790867449950; Thu, 01 Oct 2026
 08:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
 <20261001135711.1640520-17-fuad.tabba@linux.dev> <20261001141827.B97661F00899@smtp.kernel.org>
In-Reply-To: <20261001141827.B97661F00899@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 1 Oct 2026 16:10:13 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxphbwjXvuCiF3gFy+p7OVT=TdQTO0vKkZbOZkvRT9Eng@mail.gmail.com>
X-Gm-Features: AclHuK_5sMBjcN4lmvUtlFiUWRdtGWfAXLAoeNruxxE9uee1mazlgZ0PLIW_hXA
Message-ID: <CA+EHjTxphbwjXvuCiF3gFy+p7OVT=TdQTO0vKkZbOZkvRT9Eng@mail.gmail.com>
Subject: Re: [PATCH v4 16/18] KVM: arm64: Reject host power-on of a vCPU that
 EL2 holds powered off
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 01 Oct 2026 15:18:27 +0100, sashiko-bot@kernel.org wrote:
[...]
> Does this break the userspace API for KVM_SET_MP_STATE?

No. KVM_SET_MP_STATE has never accepted KVM_MP_STATE_UNINITIALIZED on
arm64, and the host can't restore a power state that EL2 owns.

[...]
> Following up on the KVM_ARM_VCPU_POWER_OFF initialization above, does this
> condition incorrectly reject guest CPU_ON requests?

No. Before the target's first KVM_RUN it has no hyp vCPU, so
pvm_psci_vcpu_on() returns INVALID_PARAMETERS at EL2 and the host
never sees the CPU_ON.

/fuad
