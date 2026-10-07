Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7644915A4;
	Wed,  7 Oct 2026 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380279; cv=none; b=OtcRlT0wuk8YizercgWrtd4K7Jq/2OOJBwSzYvHzinyZsHsZQ31F+MHRcNUu+Bt3il0BioTQhpcPMt24RpD/tRFYdqTHsSm8hst8a/3cBGfDF7Z+jHsVliiTf8QiyFsNnk5SDhTCP4HSf1NaUihKGbZZVajZeFqp8Cc3DKiiTNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380279; c=relaxed/simple;
	bh=ffI6qfDI90StMmT7qQAsDUIGBdbjL56M9Wtn1LkAXGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep577tzEuZM5rgXlr4R24Q/knN4zbt2fgbftuMbbK7nmpChmx9VFNJpCH4+4HMYGRnQJLh2V2i2ESDyH/0TN834IW46TE/t0t/uVwnzPyyADqkbZ7tEKJry52o2Hjjw3s1zZxlwcXklvTYgIHeukAka0PJOeYncK5neIwwYQPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwOa3cuU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwOa3cuU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7E21F0089B;
	Wed,  7 Oct 2026 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791380266;
	bh=G5qTBg2kaYnl8BWryrjG6nKWS+MBOErIS5isypkERcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XwOa3cuU1v6n155YTvQ0UHOnlYU/mFj3xHnuLcNznjK0Bfn8UZe+P94gvqOEFAbWP
	 PYF/eee0b0WIGhSy+QsjVdXCoT4Bprtqta2z9kO01w6EYIUFftkI3bzymNcz37vcXe
	 oBoIOs7GYdgPFXlkQ7GB4PRpwRR1587ex3VhXNaxg6Zd3bVInhJUIHH8RuW7QPisBe
	 0rz3UqNB1H3apmRX0/ZjQ4Z9ATW+xuuvOwr4N4NmW1XdKN6p2YNnHqJa+qWUwVnVfo
	 +3pHqTN3YM6nQnCHZW7++CYVyCHbNRAphSMxa7MtumsFLCKcOTvUBtxXaUAveTYTq4
	 89oPh8eCOGjHA==
Date: Wed, 7 Oct 2026 08:37:45 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v3] dt-bindings: net: Convert HiSilicon hns-dsaf
 to DT schema
Message-ID: <20261007133745.GA2792240-robh@kernel.org>
References: <20261005202808.1982164-2-robh@kernel.org>
 <sashiko-outbox-162430@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-162430@kernel.org>

On Tue, Oct 06, 2026 at 08:29:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: net: incorrect additionalProperties in port node rejects inherited properties

Explained before...

Existing users don't have any inherited properties. These are old and 
barely maintained platforms not likely to get new users.

Rob
