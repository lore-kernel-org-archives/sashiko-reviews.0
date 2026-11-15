Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756630;
	b=3zJlF2KcmRhJX8X4kH9eVaD32hS8UNQVKATohhXpRX8Ostr9NsGjb5ZWnVHr3Qz/feh/
	 xnyEob1xRU06cbamJpEOmHPGUkUGSTgDDAqEQP3TPLV48joZMepzG9GMJ7DKXw16Rr6LV
	 HeD5d9XGcE3i8MROmBI7OyzN96xM7fSAtLe4oE1JHb0G3ALfY3dcfuKNQeEzbbA8ztyjO
	 mzpQzjxScDVRJSeyJ1iZtoC4CP9/Xqo0+d3+v65KaOBQjnF/1yeimiiaByybQhENZnAIv
	 D2hfQxTR9VtYqPbcQFdy0h6ODt+b+WkYU5Y+3LRPsD7HS9F73oFGIKpg4LgrXFhrSJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756630;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=8b0NcOCbgjT502LwxuI3125LQaHRINxYB46l6CFgKcI=;
	b=egnzF5jjC4P7jYpQkOOuHe57Doly+IUJdvAQZDb0alFrE72q0sb/kZwwiaeX3brVKwpO
	 u74o76DCUuRiBV3C2h/ROz22d3/E6vgYqZaC7Hf/+W1PPpM5a4iDwyz40becGtkPRxahs
	 zPjLK33R0jkPPEI4spd8QIooJEYyFpudNIUqicSAFYdX6uX6m8eiEF5vquml+keeGKk/a
	 n3p1djR4EZqTsb252EndKjLufJviHvdC2Go4Reb8fh5J9aCpW/t4PjC+PbcCiXMm6IOV7
	 aSHLmVOxgZpOljRFyb3e3/X6swexohHEcJzu6JXOol9dxgxQLieJF3KT9tMIlvFjwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeWiPPk7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE2606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 15:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KeWiPPk7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794756629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8b0NcOCbgjT502LwxuI3125LQaHRINxYB46l6CFgKcI=;
	b=KeWiPPk7ihBhc9Hr9vurCT6Rb5q7r5/WJqGtzNFk8xMiS80Cv3GITek3GgqbWYbhSSyr+4
	KKWLSvEN5hyseJKNlcfr9Q/G91C470wOUUlk8HbNae5fcLoWOC3DIjFCls0qL0uaT0Y3nA
	8S/ophQN0BDApXq3wWg87bGmmwBzbVY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-yztVjPrgML-gcgHTrusa0w-1; Sun,
 15 Nov 2026 10:30:24 -0500
X-MC-Unique: yztVjPrgML-gcgHTrusa0w-1
X-Mimecast-MFC-AGG-ID: yztVjPrgML-gcgHTrusa0w_1794756622
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81E9618002FD;
	Sun, 15 Nov 2026 15:30:21 +0000 (UTC)
Received: from jocolema-thinkpadp1gen4i.rmtusco.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C49541F;
	Sun, 15 Nov 2026 15:30:17 +0000 (UTC)
From: "John J. Coleman" <jocolema@redhat.com>
To: akpm@linux-foundation.org
Cc: audra@redhat.com,
	david@kernel.org,
	jocolema@redhat.com,
	liam@infradead.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	rppt@kernel.org,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	surenb@google.com,
	vbabka@kernel.org,
	zenghui.yu@linux.dev
Subject: Re: [PATCH] selftests/mm: allocate nr_pages based on pmd size for uffd pmd_move tests
Date: Sun, 15 Nov 2026 08:30:13 -0700
Message-ID: <20261115153013.1801047-1-jocolema@redhat.com>
In-Reply-To: <20261114104457.6b3247d9abaff0497a9ae545@linux-foundation.org>
References: <20261114104457.6b3247d9abaff0497a9ae545@linux-foundation.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GK0ywXmW8CopAiN3_o258jcnvXloufgD14n3zIZLS6w_1794756622
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Hi Andrew, thank you for checking this!  And me-- for missing that MAX()
input especially.  I reviewed your patch and ran a test with the changes 
on my own systems as well, and it works great for me.

